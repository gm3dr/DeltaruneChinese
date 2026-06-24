import hashlib
import os
import shutil


def get_file_md5(file_path):
    """计算文件的MD5校验值"""
    if not os.path.isfile(file_path):
        return None
    md5_hash = hashlib.md5()
    with open(file_path, "rb") as f:
        # 分块读取，防止大文件占用过多内存
        for chunk in iter(lambda: f.read(4096), b""):
            md5_hash.update(chunk)
    return md5_hash.hexdigest()


def compare_and_copy_gml(
    base_dir, dir1, dir2, same_dir, diff_base_dir, diff1_dir, diff2_dir
):
    # 确保所有需要的输出文件夹存在，如果不存在则自动创建
    for d in [same_dir, diff_base_dir, diff1_dir, diff2_dir]:
        os.makedirs(d, exist_ok=True)

    # 检查基础文件夹是否存在
    if not os.path.exists(base_dir):
        print(f"错误: 文件夹 '{base_dir}' 不存在。请检查路径。")
        return

    # 遍历 base 文件夹中的所有文件
    for filename in os.listdir(base_dir):
        # 只处理 .gml 结尾的文件（忽略大小写）
        if not filename.lower().endswith(".gml"):
            continue

        base_file_path = os.path.join(base_dir, filename)

        if not os.path.isfile(base_file_path):
            continue

        file1_path = os.path.join(dir1, filename)
        file2_path = os.path.join(dir2, filename)

        # 检查 dir1 中是否存在同名文件
        if not os.path.exists(file1_path):
            print(f"警告: '{filename}' 在 '{dir1}' 中不存在，已跳过。")
            continue

        # 核心逻辑：检查 dir2 中是否存在同名文件
        if os.path.exists(file2_path):
            # 获取 file1 和 file2 的校验值进行比对
            hash1 = get_file_md5(file1_path)
            hash2 = get_file_md5(file2_path)

            if hash1 == hash2:
                # 1. 校验值相同：只复制 base 文件夹的文件到 same 文件夹
                dest_same = os.path.join(same_dir, filename)
                shutil.copy2(base_file_path, dest_same)
                print(f"[相同] '{filename}' 已复制 base 到 -> {same_dir}")
            else:
                # 2. 校验值不同：分别复制 base、file1、file2 到各自对应的 diff 文件夹
                dest_diff_base = os.path.join(diff_base_dir, filename)
                dest_diff1 = os.path.join(diff1_dir, filename)
                dest_diff2 = os.path.join(diff2_dir, filename)

                shutil.copy2(base_file_path, dest_diff_base)
                shutil.copy2(file1_path, dest_diff1)
                shutil.copy2(file2_path, dest_diff2)
                print(
                    f"[不同] '{filename}' 已分别复制 base、file1、file2 到 diff 文件夹"
                )


if __name__ == "__main__":
    # === 在此配置您的源文件夹路径 ===
    BASE_DIR = "workspace/ch4/imports/code"
    DIR1 = "workspace/export_result/ch4/code"
    DIR2 = "workspace/export_result/ch5/code"

    # === 在此配置您的输出文件夹路径 ===
    SAME_DIR = "same"  # 相同的时候，存放 base 文件的目录
    DIFF_BASE_DIR = "diff_base"  # 不同的时候，存放 base 文件的目录
    DIFF1_DIR = "diff1"  # 不同的时候，存放 file1 文件的目录
    DIFF2_DIR = "diff2"  # 不同的时候，存放 file2 文件的目录
    # ===============================

    print("开始对比和分类 GML 文件...\n" + "-" * 30)
    compare_and_copy_gml(
        BASE_DIR, DIR1, DIR2, SAME_DIR, DIFF_BASE_DIR, DIFF1_DIR, DIFF2_DIR
    )
    print("-" * 30 + "\n处理完成！")
