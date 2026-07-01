/**
 * 3-generate-atlas.js — 生成纹理图集
 */

import { spinner, log } from '@clack/prompts';
import { execAsync, pathExists, wsPath, isVerbose } from './utils.js';

export async function main() {
  const s = spinner();

  try {
    const nodeModules = wsPath('atlas_packer/node_modules');
    if (!pathExists(nodeModules)) {
      s.start('正在安装图集打包脚本的依赖');
      await execAsync('npm', ['install', '--prefix', 'atlas_packer'], {
        cwd: wsPath(), verbose: isVerbose(),
      });
    }

    s.start('正在生成图集');
    await execAsync('node', ['atlas_packer/run.js'], {
      cwd: wsPath(), verbose: isVerbose(),
    });
    s.stop('图集生成完成');
  } catch (err) {
    log.error(err.message);
    process.exit(1);
  }
}
