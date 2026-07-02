

import { join } from "node:path";
import { readFileSync, readdirSync, writeFileSync, rmSync } from "node:fs";
import { log, progress } from "@clack/prompts";
import {
  exec,
  execAsync,
  cleanDir,
  ensureDir,
  copyDir,
  copyFile,
  pathExists,
  findTool,
  sha256File,
  normalizeTimestamps,
  removeFiles,
  wsPath,
  isVerbose,
} from "./utils.js";

const NOW = new Date();
const FIXED_TIME = `${NOW.getFullYear()}-${String(NOW.getMonth() + 1).padStart(2, "0")}-${String(NOW.getDate()).padStart(2, "0")} ${String(NOW.getHours()).padStart(2, "0")}:${String(NOW.getMinutes()).padStart(2, "0")}`;
const BUILD_DATE = "Beta2";
const OLD_PATCH_COUNT = 4;
const PROJ = wsPath();
const PK = (rel) => join(PROJ, rel);
const PATCH_DIRS = {
  Win: PK("temp/patch"),
  Mac: PK("temp/patch_mac"),
  WinDemo: PK("temp/patch_demo"),
  MacDemo: PK("temp/patch_mac_demo"),
};

async function makeXDelta(src, dst, patchPath) {
  const xdelta3 = findTool("xdelta3");
  if (!xdelta3) throw new Error("未找到 xdelta3");
  await execAsync(xdelta3, ["-S", "lzma", "-e", "-s", src, dst, patchPath], {
    cwd: PROJ,
    verbose: isVerbose(),
  });
}

function copyLang(ch, destDir) {
  const langDir = wsPath(`workspace/result/ch${ch}`);
  if (!pathExists(langDir)) return;
  const target = join(destDir, "lang");
  ensureDir(target);
  for (const f of readdirSync(langDir)) {
    if (f.endsWith(".json")) copyFile(join(langDir, f), join(target, f));
  }
}

async function buildPatch(dir, tag) {
  const pureName = `patch_chs_${tag}_${BUILD_DATE}.7z`;
  const sevenZ = findTool("7z");
  if (!sevenZ) throw new Error("未找到 7z");
  await execAsync(
    sevenZ,
    ["a", "-t7z", "-mx=9", "-ms=on", "-mmt=on", pureName, `${dir}/*`],
    { cwd: PROJ, verbose: isVerbose() },
  );
}

function processChapter(ch) {
  const dstData = wsPath(`workspace/result/ch${ch}/data.win`);
  const srcWin = wsPath(`data_win/current/ch${ch}/data.win`);
  const srcMac = wsPath(`data_win/current/ch${ch}/game.ios`);
  if (pathExists(srcWin) && pathExists(dstData)) {
    makeXDelta(srcWin, dstData, join(PATCH_DIRS.Win, `chapter${ch}.xdelta`));
    copyLang(ch, join(PATCH_DIRS.Win, `chapter${ch}_windows`));
  }
  if (pathExists(srcMac) && pathExists(dstData)) {
    makeXDelta(srcMac, dstData, join(PATCH_DIRS.Mac, `chapter${ch}.xdelta`));
    copyLang(ch, join(PATCH_DIRS.Mac, `chapter${ch}_mac`));
  }
  for (let oldVer = 1; oldVer <= OLD_PATCH_COUNT; oldVer++) {
    const oldDir = wsPath(`data_win/old-${oldVer}/ch${ch}`);
    if (!pathExists(oldDir)) continue;
    if (pathExists(join(oldDir, "data.win")))
      makeXDelta(
        join(oldDir, "data.win"),
        dstData,
        join(
          PATCH_DIRS.Win,
          `chapter${ch}_${sha256File(join(oldDir, "data.win"))}.xdelta`,
        ),
      );
    if (pathExists(join(oldDir, "game.ios")))
      makeXDelta(
        join(oldDir, "game.ios"),
        dstData,
        join(
          PATCH_DIRS.Mac,
          `chapter${ch}_${sha256File(join(oldDir, "game.ios"))}.xdelta`,
        ),
      );
  }
  for (const videoCh of [3, 5]) {
    if (ch !== videoCh) continue;
    const vidSrc = wsPath(`workspace/ch${videoCh}/vid`);
    if (!pathExists(vidSrc)) continue;
    for (const plat of ["Win", "Mac"]) {
      const pl = plat === "Win" ? "windows" : "mac";
      const vd = join(PATCH_DIRS[plat], `chapter${videoCh}_${pl}`, "vid");
      ensureDir(vd);
      for (const f of readdirSync(vidSrc))
        copyFile(join(vidSrc, f), join(vd, f));
    }
  }
}

async function processMain() {
  const mainDst = wsPath("workspace/result/main/data.win");
  const mainWin = wsPath("data_win/current/main/data.win");
  const mainMac = wsPath("data_win/current/main/game.ios");
  if (pathExists(mainWin) && pathExists(mainDst))
    await makeXDelta(mainWin, mainDst, join(PATCH_DIRS.Win, "main.xdelta"));
  if (pathExists(mainMac) && pathExists(mainDst))
    await makeXDelta(mainMac, mainDst, join(PATCH_DIRS.Mac, "main.xdelta"));
  for (let oldVer = 1; oldVer <= OLD_PATCH_COUNT; oldVer++) {
    const oldDir = wsPath(`data_win/old-${oldVer}/main`);
    if (!pathExists(oldDir)) continue;
    if (pathExists(join(oldDir, "data.win")))
      await makeXDelta(
        join(oldDir, "data.win"),
        mainDst,
        join(
          PATCH_DIRS.Win,
          `main_${sha256File(join(oldDir, "data.win"))}.xdelta`,
        ),
      );
    if (pathExists(join(oldDir, "game.ios")))
      await makeXDelta(
        join(oldDir, "game.ios"),
        mainDst,
        join(
          PATCH_DIRS.Mac,
          `main_${sha256File(join(oldDir, "game.ios"))}.xdelta`,
        ),
      );
  }
}

async function processDemo() {
  const demoDst = wsPath("workspace/result/demo/data.win");
  const demoSrcWin = wsPath("data_win/current/demo/data.win");
  const demoSrcMac = wsPath("data_win/current/demo/game.ios");
  const demoResult = wsPath("workspace/result/demo");
  if (pathExists(demoResult)) {
    for (const dir of [PATCH_DIRS.WinDemo, PATCH_DIRS.MacDemo]) {
      const target = join(dir, "lang");
      ensureDir(target);
      for (const f of readdirSync(demoResult)) {
        if (f.endsWith(".json")) copyFile(join(demoResult, f), join(target, f));
      }
    }
  }
  if (pathExists(demoSrcWin) && pathExists(demoDst))
    await makeXDelta(
      demoSrcWin,
      demoDst,
      join(PATCH_DIRS.WinDemo, "main.xdelta"),
    );
  if (pathExists(demoSrcMac) && pathExists(demoDst))
    await makeXDelta(
      demoSrcMac,
      demoDst,
      join(PATCH_DIRS.MacDemo, "main.xdelta"),
    );
}

async function buildInstallers() {
  const sevenZ = findTool("7z");
  if (!sevenZ) throw new Error("未找到 7z");

  const platList = ["linux", "win", "winold"];
  const ip = progress({ style: "heavy", max: platList.length });
  ip.start("正在打包安装程序");

  for (const plat of platList) {
    const patcherDir = PK(`patcher/${plat}`);
    if (!pathExists(patcherDir)) {
      log.warn(`patcher/${plat} 不存在，跳过安装程序打包`);
      ip.advance(1, `${plat} (跳过)`);
      continue;
    }
    const platDir = PK(`temp/${plat}`);
    ensureDir(platDir);

    copyDir(patcherDir, platDir);
    const readmeSrc = PK("cn_installer/readme.txt");
    if (pathExists(readmeSrc)) {
      let readme = readFileSync(readmeSrc, "utf-8");
      readme = readme
        .replace(/\$\(CURRENT_TIME\)/g, FIXED_TIME)
        .replace(/\$\(CURRENT_DATE\)/g, BUILD_DATE);
      writeFileSync(join(platDir, `汉化更新日志-readme-${BUILD_DATE}.txt`), readme, "utf-8");
    }
    const qqImg = PK("cn_installer/汉化答疑QQ群1033065757-可以来此求助.jpg");
    if (pathExists(qqImg)) copyFile(qqImg, join(platDir, "汉化答疑QQ群1033065757-可以来此求助.jpg"));

    const win7z = PK(`patch_chs_windowslinux_${BUILD_DATE}.7z`);
    const demo7z = PK(`patch_chs_windowslinux_demo_${BUILD_DATE}.7z`);
    for (const src of [win7z, demo7z]) {
      if (pathExists(src)) copyFile(src, join(platDir, src.split("/").pop()));
    }

    normalizeTimestamps(platDir);

    if (plat === "linux") {
      await execAsync("tar", ["-czf", PK(`【Linux】三角符文汉化补丁-V${BUILD_DATE}.tar.gz`), "-C", platDir, "."], {
        cwd: PROJ, verbose: isVerbose(),
      });
    } else {
      await execAsync(sevenZ, ["a", "-t7z", "-mx=9", "-ms=on", "-mmt=on", PK(`temp/${plat}.7z`), `${platDir}/*`], {
        cwd: PROJ, verbose: isVerbose(),
      });
      const label = plat === "win" ? "Win10+（推荐）" : "Win7-";
      const exe = PK(`【${label}】三角符文汉化补丁-V${BUILD_DATE}.exe`);
      const sfx = readFileSync(PK("cn_installer/7zS2.sfx"));
      const config = readFileSync(PK(`cn_installer/${plat}/config.txt`));
      const archive = readFileSync(PK(`temp/${plat}.7z`));
      writeFileSync(exe, Buffer.concat([sfx, config, archive]));
      await execAsync(sevenZ, ["a", "-t7z", "-mx=9", "-ms=on", "-mmt=on", `${exe}.7z`, exe], {
        cwd: PROJ, verbose: isVerbose(),
      });
      rmSync(exe);
    }
    ip.advance(1, plat);
  }
  ip.stop("安装程序打包完成");

  const macDmg = PK("patcher/mac.dmg");
  if (pathExists(macDmg)) {
    copyFile(macDmg, PK(`【macOS】三角符文汉化安装器-V${BUILD_DATE}.dmg`));
  }
}

export async function main() {
  log.info(`构建时间: ${FIXED_TIME}  构建标签: ${BUILD_DATE}`);

  try {
    if (!findTool("xdelta3")) {
      log.error("未找到 xdelta3");
      process.exit(1);
    }
    if (!findTool("7z")) {
      log.error("未找到 7z");
      process.exit(1);
    }

    cleanDir(PK("temp"));
    for (const d of Object.values(PATCH_DIRS)) ensureDir(d);
    removeFiles("*.7z");

    const p1 = progress({ style: "heavy", max: 7 });
    p1.start("正在生成补丁");

    for (let ch = 1; ch <= 5; ch++) {
      await processChapter(ch);
      p1.advance(1, `第 ${ch} 章`);
    }

    await processMain();
    p1.advance(1, "启动器");

    await processDemo();
    p1.advance(1, "Demo");

    p1.stop("补丁内容已就绪");

    normalizeTimestamps(PK("temp"));

    const p2 = progress({ style: "heavy", max: 4 });
    p2.start("正在打包补丁");

    for (const t of [
      { dir: PATCH_DIRS.Win, tag: "windowslinux" },
      { dir: PATCH_DIRS.Mac, tag: "macos" },
      { dir: PATCH_DIRS.WinDemo, tag: "windowslinux_demo" },
      { dir: PATCH_DIRS.MacDemo, tag: "macos_demo" },
    ]) {
      await buildPatch(t.dir, t.tag);
      p2.advance(1, t.tag);
    }
    p2.stop("补丁打包完成");

    await buildInstallers();

    cleanDir(PK("temp"));
  } catch (err) {
    log.error(err.message);
    process.exit(1);
  }
}
