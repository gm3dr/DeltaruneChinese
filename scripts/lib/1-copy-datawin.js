/**
 * 1-copy-datawin.js — 从 Steam 复制游戏文件
 */

import { join } from 'node:path';
import { log, progress } from '@clack/prompts';
import {
  getPlatform, getSteamPaths, copyFile, pathExists,
  wsPath, ensureDir, getSteamDownloadInstructions, isVerbose,
} from './utils.js';

export async function main() {
  const plat = getPlatform();
  const paths = getSteamPaths();
  const gameVer = 'current';

  const checkDirs = [
    ['Steam 安装目录',    paths.installDir],
    ['Depot Win 版',      paths.dirWin],
    ['Depot Mac 版',      paths.dirMac],
    ['Demo Depot Win 版', paths.dirDemoWin],
    ['Demo Depot Mac 版', paths.dirDemoMac],
  ];

  let anyMissing = false;
  for (const [label, dir] of checkDirs) {
    if (!pathExists(dir)) {
      log.warn(`[!] ${label} 不存在: ${dir}`);
      anyMissing = true;
    }
  }

  if (anyMissing) {
    log.warn('部分源目录缺失，请先通过 Steam 控制台下载游戏文件：');
    log.warn(getSteamDownloadInstructions());
  }

  const p = progress({ style: 'heavy', max: 7 });

  try {
    p.start('正在复制游戏文件');
    for (let ch = 1; ch <= 5; ch++) {
      if (plat === 'darwin') {
        copyFile(join(paths.installDir, `chapter${ch}_mac/game.ios`), wsPath(`workspace/ch${ch}/data.win`));
      } else {
        copyFile(join(paths.installDir, `chapter${ch}_windows/data.win`), wsPath(`workspace/ch${ch}/data.win`));
      }
      const chDir = wsPath(`data_win/${gameVer}/ch${ch}`);
      ensureDir(chDir);
      const srcWin = join(paths.dirWin, `chapter${ch}_windows/data.win`);
      if (pathExists(srcWin)) copyFile(srcWin, join(chDir, 'data.win'));
      const srcMac = join(paths.dirMac, `chapter${ch}_mac/game.ios`);
      if (pathExists(srcMac)) copyFile(srcMac, join(chDir, 'game.ios'));
      p.advance(1, `第 ${ch} 章`);
    }

    if (plat === 'darwin') {
      copyFile(join(paths.installDir, 'game.ios'), wsPath('workspace/main/data.win'));
    } else {
      copyFile(join(paths.installDir, 'data.win'), wsPath('workspace/main/data.win'));
    }
    const mainDir = wsPath(`data_win/${gameVer}/main`);
    ensureDir(mainDir);
    if (pathExists(join(paths.dirWin, 'data.win'))) copyFile(join(paths.dirWin, 'data.win'), join(mainDir, 'data.win'));
    if (pathExists(join(paths.dirMac, 'game.ios'))) copyFile(join(paths.dirMac, 'game.ios'), join(mainDir, 'game.ios'));
    p.advance(1, '启动器');

    const demoDir = wsPath(`data_win/${gameVer}/demo`);
    ensureDir(demoDir);
    const demoWin = join(paths.dirDemoWin, 'data.win');
    if (pathExists(demoWin)) { copyFile(demoWin, wsPath('workspace/demo/data.win')); copyFile(demoWin, join(demoDir, 'data.win')); }
    const demoMac = join(paths.dirDemoMac, 'game.ios');
    if (pathExists(demoMac)) copyFile(demoMac, join(demoDir, 'game.ios'));
    p.advance(1, 'Demo');

    p.stop('游戏文件复制完成');
  } catch (err) {
    log.error(`复制失败: ${err.message}`);
    log.warn(getSteamDownloadInstructions());
    process.exit(1);
  }
}
