import { promises as fs } from 'fs';
import { packAsync } from 'free-tex-packer-core';
import { Worker, isMainThread } from 'worker_threads';

function Pack(images, savePath) {
    const cfg = {
        textureName: 'texture',
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
        padding: 0,
        extrude: 1,
        allowRotation: false,
        allowTrim: true,
        trimMode: 'trim',
        alphaThreshold: '0',
        detectIdentical: true,
        packer: 'OptimalPacker',
        packerMethod: 'Automatic',
        savePath,
        exporter: {
            fileExt: 'cfg',
            template: 'atlas_packer/template.mst'
        }
    }
    new Worker('./atlas_packer/pack_task.js', {
        workerData: { images, savePath, cfg }
    });
}
async function LoadImages(pathIns){
    const results_p = pathIns.map(async directory => {
        async function LoadFile(filename) {
            const path = filename;
            const contents = await fs.readFile(directory + filename);
            return {path, contents};
        }
        const fileList = await fs.readdir(directory);
        return await Promise.all(fileList.map(LoadFile));
    });
    return (await Promise.all(results_p)).flat();

}

const chapters = ['ch1', 'ch2', 'ch3', 'ch4', 'ch5', 'demo'];
await Promise.all(chapters.map(async chapter => {
    const images_p = LoadImages([
        `workspace/${chapter}/imports/pics/`, 
        `workspace/${chapter}/imports/pics_zhname/`
    ]);
    const pathOut = `workspace/${chapter}/imports/atlas/`;
    await fs.rm(pathOut, { recursive: true, force: true });
    await fs.mkdir(pathOut, { recursive: true });
    Pack(await images_p, pathOut);
}));