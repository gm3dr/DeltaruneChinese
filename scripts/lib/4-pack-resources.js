
import { spinner, log } from '@clack/prompts';
import { execAsync, wsPath, isVerbose } from './utils.js';

export async function main() {
  const s = spinner();

  try {
    s.start('正在编译 deltarunePacker');
    await execAsync('dotnet', ['build', '-c', 'Release', 'src'], {
      cwd: wsPath(), verbose: isVerbose(),
    });
    s.stop('编译完成');

    s.start('正在导入汉化资源到 data.win');
    await execAsync('dotnet', ['src/bin/Release/net10.0/deltarunePacker.dll', 'workspace'], {
      cwd: wsPath(), verbose: isVerbose(),
    });
    s.stop('资源导入完成');
  } catch (err) {
    log.error(err.message);
    process.exit(1);
  }
}
