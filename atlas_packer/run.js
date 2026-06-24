import { promises as fs } from 'fs';
import { packAsync } from "free-tex-packer-core";

async function readFiles(path, result) {
    const fileList = await fs.readdir(path);
    await Promise.all(
        fileList.map(async v =>
            result.push({ path: path + v, contents: await fs.readFile(path + v) })
        )
    );
}
async function Pack(pathIns, pathOut) {
    await fs.rm(pathOut, { recursive: true, force: true });
    await fs.mkdir(pathOut, { recursive: true });
    const images = [];
    await Promise.all(pathIns.map(async v => await readFiles(v, images)));
    const results = await packAsync(
        images,
        {
            textureName: "texture",
            textureFormat: "png",
            removeFileExtension: true,
            prependFolderName: false,
            base64Export: false,
            tinify: false,
            tinifyKey: "",
            scale: 1,
            filter: "none",
            fileName: "pack-result",
            width: 2048,
            height: 2048,
            fixedSize: false,
            powerOfTwo: true,
            padding: 0,
            extrude: 1,
            allowRotation: false,
            allowTrim: true,
            trimMode: "trim",
            alphaThreshold: "0",
            detectIdentical: true,
            packer: "OptimalPacker",
            packerMethod: "Automatic",
            savePath: pathOut,
            exporter: {
                fileExt: "cfg",
                template: "atlas_packer/template.mst"
            }
        }
    );
    await Promise.all(
        results.map(v => fs.writeFile(pathOut + v.name, v.buffer))
    );
}

const chapters = ["ch1", "ch2", "ch3", "ch4", "ch5", "demo"]
for (const ch of chapters) {
    Pack(
        [`workspace/${ch}/imports/pics/`, `workspace/${ch}/imports/pics_zhname/`],
        `workspace/${ch}/imports/atlas/`
    ).catch(err => console.error(`Error packing ${ch}:`, err));
}