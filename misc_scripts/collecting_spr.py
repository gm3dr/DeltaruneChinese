import os
import shutil

existing = input("Directory of existing: ").replace("\\","/")
all = input("Directory of all: ").replace("\\","/")

def folder(existing, all, output = "output"):
	for file in os.listdir(existing):
		if (os.path.isdir(existing + "/" + file)):
			folder(existing + "/" + file, all + "/" + file, output + "/" + file)
			continue
		if (os.path.isfile(existing + "/" + file)):
			if (file in os.listdir(all)):
				shutil.move(all + "/" + file, output + "/" + file)
			else:
				print(f"Error: {file} was not found in {all}")

folder(existing, all)