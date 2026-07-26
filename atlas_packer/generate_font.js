import { packAsync } from 'free-tex-packer-core';
import freetype from 'freetype2';
import { Jimp } from 'jimp';
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
    const result = Buffer.alloc(4 * bitmap.width * (bitmap.height + top_align));
    for(let y = 0; y < bitmap.height; y++) {
        if(y + top_align < 0) continue;
        for(let x = 0; x < bitmap.width; x++) {
            const bitMask = 128 >> (x % 8);
            const val = (bitmap.buffer[y * bitmap.pitch + (x >> 3)] & bitMask) > 0 ? 255 : 0;
            const offset = (y + top_align) * bitmap.width + x;
            result[4 * offset + 0] = val;
            result[4 * offset + 1] = val;
            result[4 * offset + 2] = val;
            result[4 * offset + 3] = val;
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
const font_files = new Map();
async function BitmapGenerator(cfg) {
    if (!font_files.has(cfg.path)) {
        font_files.set(cfg.path, fs.readFile(`workspace/global/font/${cfg.path}`));
    }
    const face = freetype.NewMemoryFace(await font_files.get(cfg.path));
    face.setCharSize(0, cfg.char_size, 0, 0);
    return ch => {
        const code = ch.charCodeAt(0);
        if (code < 32) {
            return null;
        }
        const glyph = face.loadChar(code, {
            render: true,
            monochrome: true,
        });
        if (glyph.bitmap === null || glyph.bitmap.width === 0 || glyph.bitmap.height === 0) {
            return null;
        }
        const top_align = (cfg.char_size - glyph.bitmapTop) + (code < 128 ? cfg.offset_en.y : cfg.offset_cn.y);
        if(top_align < 0) {
            console.log(`'${ch}' in ${cfg.name}: top_align = ${top_align}!`);
        }
        // 这里的shift+2 offset+1是历史遗留问题
        const shift = 2 + glyph.metrics.horiAdvance / 64;
        const offset = 1 + glyph.bitmapLeft + (code < 128 ? cfg.offset_en.x : cfg.offset_cn.x);
        
        return new Jimp({ 
            width: glyph.bitmap.width,
            height: glyph.bitmap.height + top_align,
            data: PreProcessBitmap(glyph.bitmap, top_align),
        }).getBuffer('image/png')
        .then(contents => ({
            path: `${cfg.name},${code},${shift},${offset}.png`,
            contents,
        }));
    }
}
const chapters = ['ch1', 'ch2', 'ch3', 'ch4', 'ch5'];
const dictWhole_p = Promise.all([
    fs.readFile('workspace/global/re_recruit.json', 'utf8'),
    fs.readFile('workspace/global/re_cnname.json', 'utf8'),
    fs.readFile(`workspace/main/imports/charset.txt`, 'utf8'),
    ...chapters.map(chapter => fs.readFile(`workspace/${chapter}/imports/text_src/cn.json`, 'utf8')),
    ...[...chapters, 'main', 'demo'].map(chapter => fs.readdir(`workspace/${chapter}/imports/code`)
        .then(files => files.map(filename => fs.readFile(`workspace/${chapter}/imports/code/${filename}`, 'utf8')))
        .then(x => x.flat())
    )
]).then(x=>x.join());
const pathOut = `workspace/global/font/atlas/`;
await fs.rm(pathOut, { recursive: true, force: true });
await fs.mkdir(pathOut, { recursive: true });
const configs = await fs.readFile(`workspace/global/font/fonts.cfg`);
const images_all = await Promise.all(JSON.parse(configs).map(async cfg => {
    const directory = `workspace/global/font/${cfg.name}/`;
    const dictWhole = new Set(await dictWhole_p);
    async function LoadFile(filename) {
        const lastDot = filename.lastIndexOf('.');
        const segments = lastDot <= 0 ? filename.split(',') : filename.slice(0, lastDot).split(',');
        const char = parseInt(segments[0]);
        const shift = segments[1];
        const offset = parseInt(segments[2]) + (char < 128 ? cfg.offset_en.x : cfg.offset_cn.x);
        dictWhole.delete(String.fromCharCode(char));
        const top_align = (char < 128 ? cfg.offset_en.y : cfg.offset_cn.y);
        const path = `${cfg.name},${char},${shift},${offset}.png`;
        let contents = await fs.readFile(directory + filename);
        if(top_align > 0) {
            const src = await Jimp.fromBuffer(contents);
            contents = await new Jimp({ 
                width: src.bitmap.width,
                height: src.bitmap.height + top_align,
                color: '#00000000'
            }).blit({
                src,
                x: 0,
                y: top_align,
            }).getBuffer('image/png');
        }
        return { path, contents };
    }
    const images_pic = await fs.readdir(directory).then(fileList => Promise.all(fileList.map(LoadFile)));
    
    const images_fnt = await BitmapGenerator(cfg)
        .then(GetBitmap => Promise.all(Array.from(dictWhole).map(GetBitmap)))
        .then(results => results.filter(x => x != null));
    const images = [...images_pic, ...images_fnt];
    Pack(images, pathOut, cfg.name);
    return images; 
}));
// all in one texture(taking too long)
// Pack(images_all.flat(), pathOut, 'all_in_one');
