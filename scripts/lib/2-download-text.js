
import { spinner, log, password, text, isCancel } from '@clack/prompts';
import { writeFileSync } from 'node:fs';
import { wsPath, pathExists, readEnvFile } from './utils.js';

export async function main() {
  let TOKEN = process.env.TOKEN, URL = process.env.URL;
  const secretsPath = wsPath('secrets.ps1');

  if (!TOKEN && pathExists(secretsPath)) {
    log.info('发现 secrets.ps1');
    const env = readEnvFile(secretsPath);
    TOKEN = TOKEN || env.TOKEN; URL = URL || env.URL;
  }
  if (!TOKEN) {
    const ans = await password({ message: '请输入 Weblate API Token', validate: v => v ? undefined : '不能为空' });
    if (isCancel(ans)) process.exit(1);
    TOKEN = ans;
  }
  if (!URL) {
    const ans = await text({ message: '请输入 Weblate 站点 URL', initialValue: process.env.URL || '', validate: v => v ? undefined : '不能为空' });
    if (isCancel(ans)) process.exit(1);
    URL = ans;
  }

  const s = spinner();
  for (const ch of ['ch1', 'ch2', 'ch3', 'ch4', 'ch5']) {
    s.start(`正在下载 ${ch}`);
    try {
      const base = `${URL}/api/translations/deltarune/${ch}`;
      const en = await fetch(`${base}/en/file/`, { headers: { Authorization: `Token ${TOKEN}` } });
      if (!en.ok) throw new Error(`en.json HTTP ${en.status}`);
      writeFileSync(wsPath(`workspace/${ch}/imports/text_src/en.json`), await en.text(), 'utf-8');
      const cn = await fetch(`${base}/zh_Hans/file/`, { headers: { Authorization: `Token ${TOKEN}` } });
      if (!cn.ok) throw new Error(`cn.json HTTP ${cn.status}`);
      writeFileSync(wsPath(`workspace/${ch}/imports/text_src/cn.json`), await cn.text(), 'utf-8');
      s.stop(`${ch} 下载完成`);
    } catch (err) { s.stop(`${ch} 下载失败`); log.error(err.message); process.exit(1); }
  }
}
