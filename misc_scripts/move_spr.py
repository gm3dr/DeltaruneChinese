import os
import shutil

source = input("Source directory: ").replace("\\","/")
target = input("Target directory: ").replace("\\","/")

def folder(source, target):
	files = []
	for file in os.listdir(target):
		if (os.path.isdir(target + "/" + file)):
			if ("pic" in file):
				folder(source, target + "/" + file)
			continue
		if (os.path.isfile(target + "/" + file)):
			if (file.endswith(".png")):
				if (file in os.listdir(source)):
					os.remove(target + "/" + file)
					shutil.move(source + "/" + file, target + "/" + file)
					print(f"Replaced {target}/{file} with {source}/{file}")
				else:
					files.append(file)
					print(f"Didn't found {target}/{file} in {source}")
	print(f"Didn't found files in source: {files}")

folder(source, target)