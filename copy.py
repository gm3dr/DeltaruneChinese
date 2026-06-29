import os
import shutil


def copy_duplicate_files(src_dir_a, check_dir_b, dest_dir_c):
    """从文件夹 A 读取文件，若文件夹 B 存在同名文件，则复制到文件夹 C（不覆盖）"""
    # 确保目标文件夹 C 存在，如果不存在则创建
    if not os.path.exists(dest_dir_c):
        os.makedirs(dest_dir_c)
        print(f"创建目标文件夹: {dest_dir_c}")

    # 获取文件夹 A 和 B 中的所有文件名（忽略子文件夹，只匹配文件）
    files_in_a = [
        f for f in os.listdir(src_dir_a) if os.path.isfile(os.path.join(src_dir_a, f))
    ]
    files_in_b = set(
        [
            f
            for f in os.listdir(check_dir_b)
            if os.path.isfile(os.path.join(check_dir_b, f))
        ]
    )

    copied_count = 0
    skipped_count = 0

    print("开始比对并复制文件...")
    print("-" * 40)

    for file_name in files_in_a:
        # 检查文件夹 B 中是否存在同名文件
        if file_name in files_in_b:
            src_file_path = os.path.join(check_dir_b, file_name)
            dest_file_path = os.path.join(dest_dir_c, file_name)

            # 检查文件夹 C 中是否已经存在该文件（实现不覆盖逻辑）
            if not os.path.exists(dest_file_path):
                try:
                    shutil.copy2(src_file_path, dest_file_path)
                    print(f"已复制: {file_name} -> 文件夹 C")
                    copied_count += 1
                except Exception as e:
                    print(f"复制 {file_name} 时出错: {e}")
            else:
                print(f"已跳过: {file_name} (文件夹 C 中已存在同名文件)")
                skipped_count += 1

    print("-" * 40)
    print(
        f"运行结束！共复制了 {copied_count} 个文件，跳过了 {skipped_count} 个已存在的文件。"
    )


# --- 使用示例 ---
if __name__ == "__main__":
    # 在这里填写你的文件夹绝对路径或相对路径
    # 注意：Windows 系统下路径中的斜杠建议写成正斜杠 '/' 或者双反斜杠 '\\'
    folder_a = "workspace/ch2/imports/code"
    folder_b = "../drcode/ch5"
    folder_c = "workspace/ch5/imports/code"

    # 执行函数
    copy_duplicate_files(folder_a, folder_b, folder_c)
