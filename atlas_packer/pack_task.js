import  {workerData } from 'worker_threads';
import { packAsync } from "free-tex-packer-core";
import { promises as fs } from 'fs';
let {images, savePath, cfg} = workerData;
images = images.map( image => ({
    path: image.path,
    contents: Buffer.from(image.contents)
}));
await packAsync(images, cfg).then(results => 
    Promise.all(results.map(v => 
        fs.writeFile(savePath + v.name, v.buffer)
    )
));