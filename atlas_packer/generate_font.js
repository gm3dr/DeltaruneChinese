import { packAsync } from 'free-tex-packer-core';
import freetype from 'freetype2';
import sharp from 'sharp';
import { promises as fs } from 'fs';
import { Worker, isMainThread } from 'worker_threads';

function Pack(images, savePath, textureName) {
    const cfg = {
        textureName,
        textureFormat: 'png',
        removeFileExtension: true,
        prependFolderName: false,
        base64Export: false,
        tinify: false,
        tinifyKey: '',
        scale: 1,
        filter: 'none',
        fileName: 'pack-result',
        width: 2048,
        height: 2048,
        fixedSize: false,
        powerOfTwo: true,
        padding: 1,
        extrude: 0,
        allowRotation: false,
        allowTrim: false,
        trimMode: 'trim',
        alphaThreshold: '0',
        detectIdentical: true,
        packer: 'MaxRectsPacker', // 千万不要学隔壁用OptimalPacker，这里图太多了
        packerMethod: 'Smart',
        savePath,
        exporter: {
            fileExt: 'cfg',
            template: 'atlas_packer/font.mst'
        }
    }
    new Worker('./atlas_packer/pack_task.js', {
        workerData: { images, savePath, cfg }
    });
}
function PreProcessBitmap(bitmap, top_align) {
    if (top_align < 0) {
        top_align = 0;
    }
    const result = Buffer.alloc(bitmap.width * (bitmap.height + top_align));
    for(let y = 0; y < bitmap.height; y++) {
        for(let x = 0; x < bitmap.width; x++) {
            const bitMask = 128 >> (x % 8);
            const val = bitmap.buffer[y * bitmap.pitch + (x >> 3)] & bitMask;
            result[(y + top_align) * bitmap.width + x] = val > 0 ? 255 : 0;
        }
    }
    return result;
}
// cfg format: {
// 	"name": "fnt_main",
// 	"path": ".../normal.ttf",
// 	"char_size": 12,
// 	"offset_en": {"x": 1, "y": 2},
// 	"offset_cn": {"x": 2, "y": 0}
// }
const generators = new Map();
const font_files = new Map();
async function BitmapGenerator(cfg) {
    //注意这里的cache策略会复用name和char_size相同的图
    const key = cfg.name + cfg.char_size;
    if(!generators.has(key)) {
        if (!font_files.has(cfg.path)) {
            font_files.set(cfg.path, fs.readFile(`workspace/global/${cfg.path}`));
        }
        const face = freetype.NewMemoryFace(await font_files.get(cfg.path));
        face.setCharSize(0, cfg.char_size, 0, 0);
        const cache = new Map();
        async function GetBitmap(ch){
            const code = ch.charCodeAt(0);
            if (code < 32) {
                return null;
            }
            const glyph = face.loadChar(code, {
                render: true,
                monochrome: true,
            });
            if (glyph.bitmap === null || glyph.bitmap.width === 0 || glyph.bitmap.height === 0){
                return null;
            }
            const top_align = (cfg.char_size - glyph.bitmapTop) + (code < 128 ? cfg.offset_en.y : cfg.offset_cn.y);
            const width = glyph.bitmap.width;
            const height = glyph.bitmap.height + top_align;
            const img = sharp({create: {
                width,
                height,
                channels: 3,
                background: {r:255, g:255, b:255}
            }}).joinChannel(
                PreProcessBitmap(glyph.bitmap, top_align),
                { raw: {width, height, channels: 1}}
            );
            // 这里的shift+2 offset+1是历史遗留问题
            const shift = 2 + glyph.metrics.horiAdvance / 64;
            const offset = 1 + glyph.bitmapLeft + (code < 128 ? cfg.offset_en.x : cfg.offset_cn.x);
            
            const path = `${cfg.name},${code},${shift},${offset}.png`
            const contents = await img.png().toBuffer();
            return {path, contents};
        }
        generators.set(key, ch => {
            if(cache.has(ch)) {
                return cache.get(ch);
            }
            const promise = GetBitmap(ch);
            cache.set(ch, promise);
            return promise;
        });
    }
    return generators.get(key);
    //如果后续有单独改的需求 这里需要重写一下


}
async function BuildDic(directory){
    const codePath = `${directory}/imports/code`;
    if(directory.endsWith('main')) {
        const result = await Promise.all([
            fs.readFile(`${directory}/imports/font/charset.txt`, 'utf8'),
            fs.readdir(codePath).then(async files => 
                Promise.all(files.map(filename => fs.readFile(`${codePath}/${filename}`, 'utf8'))).then(x => x.join())
            )
        ]);
        return result.join('');
    } else if(directory.endsWith('demo')) {
        const result = await Promise.all([
            fs.readFile(`${directory}/../global/re_recruit.json`, 'utf8'),
            fs.readFile(`${directory}/../global/re_cnname.json`, 'utf8'),
            fs.readFile(`${directory}/../ch1/imports/text_src/cn.json`, 'utf8'),
            fs.readFile(`${directory}/../ch2/imports/text_src/cn.json`, 'utf8'),
            fs.readdir(codePath).then(async files => 
                Promise.all(files.map(filename => fs.readFile(`${codePath}/${filename}`, 'utf8'))).then(x => x.join())
            )
        ]);
        return result.join('');
    } else {
        const result = await Promise.all([
            fs.readFile(`${directory}/../global/re_recruit.json`, 'utf8'),
            fs.readFile(`${directory}/../global/re_cnname.json`, 'utf8'),
            fs.readFile(`${directory}/imports/text_src/cn.json`, 'utf8'),
            fs.readdir(codePath).then(async files => 
                Promise.all(files.map(filename => fs.readFile(`${codePath}/${filename}`, 'utf8'))).then(x => x.join())
            )
        ]);
        return result.join('');
    }
}


const chapters = ['ch1', 'ch2', 'ch3', 'ch4', 'ch5', 'main', 'demo'];
await Promise.all(chapters.map(async chapter => {
    
    const dict_p = BuildDic(`workspace/${chapter}`);
    const configs = await fs.readFile(`workspace/${chapter}/imports/font/fonts.cfg`);
    const pathOut = `workspace/${chapter}/imports/font/atlas/`;
    await fs.rm(pathOut, { recursive: true, force: true });
    await fs.mkdir(pathOut, { recursive: true });
    const images_all = await Promise.all(JSON.parse(configs).map(async cfg => {
        const directory = `workspace/${chapter}/imports/font/${cfg.name}/`;
        const dict = new Set(await dict_p);
        async function LoadFile(filename) {
            const lastDot = filename.lastIndexOf('.');
            const segments = lastDot <= 0 ? filename.split(',') : filename.slice(0, lastDot).split(',');
            const char = parseInt(segments[0]);
            const shift = segments[1];
            const offset = parseInt(segments[2]) + (char < 128 ? cfg.offset_en.x : cfg.offset_cn.x);
            dict.delete(String.fromCharCode(char));
            const top_align = (char < 128 ? cfg.offset_en.y : cfg.offset_cn.y);
            const path = `${cfg.name},${char},${shift},${offset}.png`;
            if(top_align <= 0) {
                return { path, contents: 
                    await fs.readFile(directory + filename),
                };
            }
            return { path, contents: 
                await sharp(directory + filename).extend({
                    background: {r:0, g:0, b:0, alpha:0},
                    top: top_align,
                    left: 0,
                }).toBuffer(),
            };
            
        }
        const images_pic = await fs.readdir(directory).then(fileList => Promise.all(fileList.map(LoadFile)));
        const images_fnt = (await Promise.all(Array.from(dict).map(await BitmapGenerator(cfg)))).filter(x => x != null);
        const images = [images_pic, images_fnt].flat();
        Pack(images, pathOut, cfg.name);
        return images;
    }));
    // all in one texture(taking too long)
    // Pack(images_all.flat(), pathOut, 'all_in_one');
}));