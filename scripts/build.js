#!/usr/bin/env node
/**
 * build.js — 汉化补丁构建入口
 *
 * 显示多选菜单，用户选择要执行的步骤后依次运行。
 * 支持 --verbose（-v）参数显示外部工具输出。
 */

import { intro, outro, log, note, multiselect, isCancel } from '@clack/prompts';

const STEPS = {
  copy:  { name: '复制游戏文件', file: './lib/1-copy-datawin.js' },
  text:  { name: '下载翻译文本', file: './lib/2-download-text.js' },
  atlas: { name: '生成纹理图集', file: './lib/3-generate-atlas.js' },
  pack:  { name: '打包汉化资源', file: './lib/4-pack-resources.js' },
  patch: { name: '生成汉化补丁', file: './lib/5-generate-patch.js' },
};

async function main() {
  intro('汉化补丁构建');

  const selected = await multiselect({
    message: '选择要执行的步骤',
    options: [
      { value: 'copy',  label: '复制游戏文件', hint: '从 Steam 目录复制原始数据' },
      { value: 'text',  label: '下载翻译文本', hint: '从 Weblate 拉取最新翻译' },
      { value: 'atlas', label: '生成纹理图集', hint: '运行图集打包脚本' },
      { value: 'pack',  label: '打包汉化资源', hint: '编译 C# 工具并导入字体/文本/代码' },
      { value: 'patch', label: '生成汉化补丁', hint: '生成 xdelta 差分及 7z 安装包' },
    ],
    initialValues: ['copy', 'atlas', 'pack', 'patch'],
    required: false,
    maxItems: 5,
  });

  if (isCancel(selected)) process.exit(1);
  if (selected.length === 0) {
    log.warn('未选择任何步骤，退出');
    process.exit(0);
  }

  for (const key of selected) {
    const step = STEPS[key];
    try {
      const mod = await import(step.file);
      if (mod.main) await mod.main();
    } catch (err) {
      log.error(`[${step.name}] 失败: ${err.message || err}`);
      process.exit(1);
    }
  }

  note(`输出位置:
  workspace/result/{ch}/data.win  — 汉化后的游戏数据文件
  patch_chs_*.7z                  — 汉化补丁压缩包`, '构建完成');
}

main();
