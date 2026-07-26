import  {workerData } from 'worker_threads';
import pack from "free-tex-packer-core";
import { promises as fs } from 'fs';
let {images, savePath, cfg} = workerData;
images = images.map( image => ({
    path: image.path,
    contents: Buffer.from(image.contents)
}));
const beginTime = Date.now();
pack(images, cfg, results => {
    console.log(`${savePath + cfg.textureName}: packed ${images.length} items in ${(Date.now() - beginTime) / 1000} seconds`);
    Promise.all(results.map(v => 
        fs.writeFile(savePath + v.name, v.buffer)
    ));
});