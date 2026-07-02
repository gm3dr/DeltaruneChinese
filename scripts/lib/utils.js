
import { readFileSync, copyFileSync, mkdirSync, rmSync, readdirSync, statSync, utimesSync } from 'node:fs';
import { join, dirname, basename, resolve } from 'node:path';
import { spawnSync } from 'node:child_process';
import { createHash } from 'node:crypto';
import { homedir, platform } from 'node:os';
import { fileURLToPath } from 'node:url';

// 命令行选项
const ARGV = process.argv.slice(2);
const VERBOSE = ARGV.includes('--verbose') || ARGV.includes('-v');

export function isVerbose() {
  return VERBOSE;
}

// 当前文件目录
const __dirname = dirname(fileURLToPath(import.meta.url));

// 操作系统检测
export function getPlatform() {
  const p = platform();
  if (p === 'win32' || p === 'darwin' || p === 'linux') return p;
  throw new Error(`不支持的操作系统: ${p}`);
}

// Steam 路径
export function getSteamPaths() {
  const plat = getPlatform();
  const home = homedir();

  let installDir, contentDir;

  if (plat === 'win32') {
    installDir = 'C:/Program Files (x86)/Steam/steamapps/common/DELTARUNE';
    contentDir = 'C:/Program Files (x86)/Steam/steamapps/content';
  } else if (plat === 'darwin') {
    installDir = join(home, 'Library/Application Support/Steam/steamapps/common/DELTARUNE/DELTARUNE.app/Contents/Resources');
    contentDir = join(home, 'Library/Application Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/steamapps/content');
  } else {
    // linux
    installDir = join(home, '.local/share/Steam/steamapps/common/DELTARUNE');
    contentDir = join(home, '.local/share/Steam/ubuntu12_32/steamapps/content');
  }

  return {
    installDir,
    contentDir,
    dirWin:       join(contentDir, 'app_1671210/depot_1671212'),
    dirMac:       join(contentDir, 'app_1671210/depot_1671213/DELTARUNE.app/Contents/Resources'),
    dirDemoWin:   join(contentDir, 'app_1690940/depot_1690941'),
    dirDemoMac:   join(contentDir, 'app_1690940/depot_1690942/DELTARUNE.app/Contents/Resources'),
  };
}

// 文件和目录操作
export function ensureDir(dir) {
  mkdirSync(dir, { recursive: true });
}

export function cleanDir(dir) {
  rmSync(dir, { recursive: true, force: true });
  mkdirSync(dir, { recursive: true });
}

/**
 * 复制单个文件。自动创建父目录。
 * 源文件不存在则抛错。
 */
export function copyFile(src, dest) {
  ensureDir(dirname(dest));
  copyFileSync(src, dest);
}

/**
 * 递归复制目录。
 */
export function copyDir(src, dest) {
  rmSync(dest, { recursive: true, force: true });
  mkdirSync(dest, { recursive: true });

  const entries = readdirSync(src, { withFileTypes: true });
  for (const entry of entries) {
    const s = join(src, entry.name);
    const d = join(dest, entry.name);
    if (entry.isDirectory()) {
      copyDir(s, d);
    } else {
      copyFileSync(s, d);
    }
  }
}

/**
 * 检查路径是否存在。
 */
export function pathExists(p) {
  try {
    statSync(p);
    return true;
  } catch {
    return false;
  }
}

/**
 * 检查路径是否为目录。
 */
export function isDir(p) {
  try {
    return statSync(p).isDirectory();
  } catch {
    return false;
  }
}

/**
 * 外部命令执行。
 *
 * opts.verbose — 强制显示输出（无视 VERBOSE 全局开关）
 *              — 设为 false 则静默执行，仅返回 stdout
 *              — 不传则使用全局 VERBOSE 值
 */
export function exec(bin, args = [], opts = {}) {
  const showOutput = opts.verbose !== undefined ? opts.verbose : VERBOSE;
  const result = spawnSync(bin, args, {
    stdio: showOutput ? 'inherit' : 'pipe',
    ...opts,
  });
  let stdout = result.stdout?.toString() ?? '';
  let stderr = result.stderr?.toString() ?? '';

  if (result.error) {
    throw new Error(`执行失败 ${bin}: ${result.error.message}\n${stderr}`);
  }
  if (result.status !== 0) {
    const detail = showOutput ? '' : `\n--- stdout ---\n${stdout || '(空)'}\n--- stderr ---\n${stderr || '(空)'}`;
    throw new Error(`命令退出码 ${result.status}: ${bin} ${args.join(' ')}${detail}`);
  }
  return stdout;
}

/**
 * 异步外部命令执行（不阻塞事件循环，支持 spinner 动画）。
 */
import { spawn } from 'node:child_process';

export function execAsync(bin, args = [], opts = {}) {
  const showOutput = opts.verbose !== undefined ? opts.verbose : VERBOSE;
  return new Promise((resolve, reject) => {
    const child = spawn(bin, args, {
      stdio: showOutput ? 'inherit' : 'pipe',
      ...opts,
    });
    let stdout = '';
    let stderr = '';

    if (child.stdout) child.stdout.on('data', (d) => { stdout += d.toString(); });
    if (child.stderr) child.stderr.on('data', (d) => { stderr += d.toString(); });

    child.on('close', (code) => {
      if (code !== 0) {
        const detail = showOutput ? '' : `\n--- stdout ---\n${stdout || '(空)'}\n--- stderr ---\n${stderr || '(空)'}`;
        reject(new Error(`命令退出码 ${code}: ${bin} ${args.join(' ')}${detail}`));
      } else {
        resolve(stdout);
      }
    });
    child.on('error', (err) => {
      reject(new Error(`执行失败 ${bin}: ${err.message}\n${stderr}`));
    });
  });
}

// SHA256（取前 8 位 hex）
export function sha256File(filePath) {
  const data = readFileSync(filePath);
  return createHash('sha256').update(data).digest('hex').slice(0, 8);
}

// 时间戳归一化
export function normalizeTimestamps(dir) {
  const now = new Date();
  _recurseTimestamps(dir, now);
}

function _recurseTimestamps(dir, time) {
  let entries;
  try {
    entries = readdirSync(dir, { withFileTypes: true });
  } catch {
    return;
  }
  for (const entry of entries) {
    const full = join(dir, entry.name);
    try {
      utimesSync(full, time, time);
    } catch { /* 跳过无法写入的项目 */ }
    if (entry.isDirectory()) {
      _recurseTimestamps(full, time);
    }
  }
}

// 读取 secrets.ps1
export function readEnvFile(filePath) {
  try {
    const content = readFileSync(filePath, 'utf-8');
    const env = {};
    for (const line of content.split('\n')) {
      const trimmed = line.trim();
      // 匹配: $env:KEY = "VALUE"  或  $env:KEY = 'VALUE'
      const m = trimmed.match(/^\$env:(\w+)\s*=\s*["'](.+?)["']$/);
      if (m) {
        env[m[1]] = m[2];
      }
    }
    return env;
  } catch {
    return {};
  }
}

// 工具定位器
/**
 * 查找可执行工具。查找顺序：
 *   1. tool/<name>.exe（Windows）或 tool/<name>（其他平台）
 *   2. 系统 PATH
 * 返回完整路径，未找到时返回 null。
 */
export function findTool(name) {
  const plat = getPlatform();
  const toolDir = join(PROJECT_ROOT, 'tool');

  const toolPath = plat === 'win32'
    ? join(toolDir, `${name}.exe`)
    : join(toolDir, name);

  if (pathExists(toolPath)) return toolPat
  if (plat === 'win32' && !name.endsWith('.exe')) {
    const withExe = join(toolDir, `${name}.exe`);
    if (pathExists(withExe)) return withExe;
  }

  const result = spawnSync(
    plat === 'win32' ? 'where' : 'which',
    [name],
    { stdio: 'pipe' }
  );
  if (result.status === 0) {
    return result.stdout.toString().trim().split('\n')[0];
  }

  return null;
}

// 简易通配符删除
export function removeFiles(pattern) {
  const entries = readdirSync(PROJECT_ROOT, { withFileTypes: true });
  for (const entry of entries) {
    if (entry.isFile()) {
      const fn = entry.name;
      if (_matchGlob(fn, pattern)) {
        rmSync(join(PROJECT_ROOT, fn));
      }
    }
  }
}

function _matchGlob(name, pattern) {
  if (pattern.startsWith('*.')) {
    return name.endsWith(pattern.slice(1));
  }
  return name === pattern;
}

/**
 * 返回 MANIFEST.md 中的 depot 下载指令文本（供用户参考）。
 */
export function getSteamDownloadInstructions() {
  const manifestPath = wsPath('MANIFEST.md');
  try {
    const content = readFileSync(manifestPath, 'utf-8');
    // 提取 "使用方法" 下方代码块中的 download_depot 命令
    const lines = content.split('\n');
    let inBlock = false;
    const cmds = [];
    for (const line of lines) {
      if (line.trim().startsWith('```')) {
        inBlock = !inBlock;
        continue;
      }
      if (inBlock && line.trim().startsWith('download_depot')) cmds.push(line.trim());
    }
    if (cmds.length === 0) throw new Error('MANIFEST.md 中未找到 download_depot 命令');
    return [
      '在 Steam 控制台 (steam://open/console) 中输入以下命令：',
      '',
      ...cmds.map(c => `  ${c}`),
      '',
      `更新日志见 MANIFEST.md（项目根目录）`,
    ].join('\n');
  } catch (err) {
    return `无法读取 MANIFEST.md: ${err.message}\n请查看仓库中的 MANIFEST.md 获取 Steam download_depot 命令。`;
  }
}

// 项目根目录
// utils.js 位于 scripts/lib/，向上两层到达项目根目录
export const PROJECT_ROOT = resolve(__dirname, '..', '..');

export function wsPath(...segments) {
  return join(PROJECT_ROOT, ...segments);
}
