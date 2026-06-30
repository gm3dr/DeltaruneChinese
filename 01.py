import json


def sort_json_by_key_length(input_file, output_file):
    try:
        # 1. 读取乱序的 JSON 文件
        with open(input_file, "r", encoding="utf-8") as f:
            data = json.load(f)

        # 2. 按照键（Key）的长度进行降序排序
        # data.items() 返回 (key, value) 元组
        # key=lambda x: len(x[0]) 表示按照元组的第一个元素（即键）的长度进行排序
        # reverse=True 表示从长到短降序排列
        sorted_items = sorted(data.items(), key=lambda x: len(x[0]), reverse=True)

        # 3. 将排序后的列表重新转换为字典（Python 3.7+ 会保留此顺序）
        sorted_data = dict(sorted_items)

        # 4. 写入新的 JSON 文件
        # ensure_ascii=False 确保中文正常显示而不是转义字符
        # indent=4 让输出的 JSON 有良好的格式和缩进
        with open(output_file, "w", encoding="utf-8") as f:
            json.dump(sorted_data, f, ensure_ascii=False, indent=4)

        print(f"✅ 处理成功！共对 {len(sorted_data)} 条词条进行了重排。")
        print(f"📁 排序后的文件已保存至：{output_file}")

    except FileNotFoundError:
        print(f"❌ 错误：找不到文件 '{input_file}'，请检查文件名和路径。")
    except json.JSONDecodeError:
        print(f"❌ 错误：'{input_file}' 不是有效的 JSON 格式。")


if __name__ == "__main__":
    # 配置输入和输出的文件名
    INPUT_JSON = "workspace/global/re_recruit.json"
    OUTPUT_JSON = "workspace/global/re_recruit.json"

    sort_json_by_key_length(INPUT_JSON, OUTPUT_JSON)
