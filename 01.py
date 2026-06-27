import os
import shutil

# 定义文件夹路径（请根据你的实际路径修改）
folder_b = (
    r"C:\d\code\deltarunechinese\workspace\ch5\imports\code"  # 源文件所在的 a 文件夹
)
folder_a = r"C:\d\code\ch5workspace"  # 含有 gml 文件的 b 文件夹
folder_dest = "./output"  # 复制出来的同名文件存放的新文件夹（避免覆盖原 a 文件夹）

# 如果你想直接覆盖或移动到 a，可以根据需要调整逻辑。
# 这里默认安全做法：把 a 中同名文件复制到一个新文件夹中。

if not os.path.exists(folder_dest):
    os.makedirs(folder_dest)

# 1. 读取 b 文件夹中所有 gml 文件的文件名（不带后缀）
b_file_names = set()
for file in os.listdir(folder_b):
    if file.endswith(".gml"):
        name_without_ext = os.path.splitext(file)[0]
        b_file_names.add(name_without_ext)

# 2. 遍历 a 文件夹，匹配同名文件并复制
copied_count = 0
for file in os.listdir(folder_a):
    name_without_ext = os.path.splitext(file)[0]

    # 如果 a 文件夹中的文件名在 b 文件夹中存在
    if name_without_ext in b_file_names:
        src_path = os.path.join(folder_a, file)
        dest_path = os.path.join(folder_dest, file)

        shutil.copy2(src_path, dest_path)
        print(f"已复制: {file}")
        copied_count += 1

print(f"\n任务完成！共复制了 {copied_count} 个文件到 {folder_dest} 文件夹。")
