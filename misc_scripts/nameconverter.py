import json
import re
import os
from pathlib import Path

def load_name_mappings(cnname_path):
    with open(cnname_path, 'r', encoding='utf-8') as f:
        return json.load(f)

def convert_names(text, name_mappings):
    # 对每个映射对创建正则表达式
    for en_name, cn_name in name_mappings.items():
        pattern = re.compile(rf'(?:(?<=[\u4e00-\u9fff\W])|(?<=\\n)|(?<=\\[a-z][a-z])|(?<=^))({re.escape(en_name)})(?:(?=[\u4e00-\u9fff\W])|(?=\\n)|(?=$))', flags=re.IGNORECASE)
        text = re.sub(pattern, cn_name, text)
    return text

def process_json_file(input_path, output_path, name_mappings):
    # 读取源文件
    with open(input_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    # 处理所有值
    converted_data = {}
    for key, value in data.items():
        if isinstance(value, str):
            if "special_name_check" in key:
                converted_data[key] = value  # 保留特殊名称不转换
            else:
                converted_data[key] = convert_names(value, name_mappings)
        else:
            converted_data[key] = value

    # 保存结果
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(converted_data, f, ensure_ascii=False, indent=2)

def main():
    # 基础路径
    base_path = Path(__file__).parent
    
    # 加载名称映射
    cnname_path = base_path / 'cnname.json'
    name_mappings = load_name_mappings(cnname_path)

    # 处理各章节
    for chapter in range(1, 5):
        pattern = f"ch{chapter}_*_v1"
        for chapter_dir in base_path.glob(pattern):
            if chapter_dir.is_dir():
                input_file = chapter_dir / 'lang_en.json'
                output_file = chapter_dir / 'lang_en_names.json'
                
                if input_file.exists():
                    process_json_file(input_file, output_file, name_mappings)
                    print(f"Processed {input_file} -> {output_file}")

if __name__ == "__main__":
    main()
