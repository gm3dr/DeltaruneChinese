from opencc import OpenCC
import os

def convert(directory):
	for dirfile in os.listdir(directory):
		path = os.path.join(directory, dirfile)
		if (os.path.isdir(path)):
			convert(path)
			continue
		if (dirfile.endswith(".py") or not os.path.isfile(path)):
			continue
		with open(path, "r", encoding="utf-8") as f:
			content = f.read()
			with open(directory + "/output/" + dirfile, "w", encoding="utf-8") as ff:
				content = cc.convert(content)
				content = content.replace("“","「").replace("”","」").replace("‘","『").replace("’","』").replace("【","「").replace("】","」")
				ff.write(content)

cc = OpenCC("s2twp.json")
directory = input("Directory: ").replace("\\","/")
convert(directory)