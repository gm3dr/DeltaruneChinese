import os

source = input("Source directory: ").replace("\\","/")
target = input("Target directory: ").replace("\\","/")

def folder(source, target, result = ""):
	for file in os.listdir(source):
		if (os.path.isdir(source + "/" + file)):
			folder(source + "/" + file, target + "/" + file, result)
			continue
		if (os.path.isfile(source + "/" + file)):
			if (not file in os.listdir(target)):
				result += file + "\n"
	return result

with open("result.txt", "w", encoding="utf-8") as ff:
	ff.write(folder(source, target))