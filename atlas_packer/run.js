
import { promises as fs } from 'fs';
import { packAsync } from "free-tex-packer-core";
async function readFiles(path, result) {
    const fileList = await fs.readdir(path);
    await Promise.all(
        fileList.map(async v => 
            result.push({path: path + v, contents: await fs.readFile(path + v)})
        )
    );
}
async function Pack(pathIns, pathOut) {
    const images = [];
    await Promise.all(pathIns.map(async v => await readFiles(v, images)));
    await packAsync(
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
            exporter: "custom",
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
    ).then(async results => 
        await Promise.all(
            results.map(v => fs.writeFile(pathOut + v.name, v.buffer))
        )
    );
}
Pack(["workspace/ch1/imports/pics/","workspace/ch1/imports/pics_zhname/"], "workspace/ch1/imports/atlas/");
Pack(["workspace/ch2/imports/pics/","workspace/ch2/imports/pics_zhname/"], "workspace/ch2/imports/atlas/");
Pack(["workspace/ch3/imports/pics/","workspace/ch3/imports/pics_zhname/"], "workspace/ch3/imports/atlas/");
Pack(["workspace/ch4/imports/pics/","workspace/ch4/imports/pics_zhname/"], "workspace/ch4/imports/atlas/");