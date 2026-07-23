import shutil
from pathlib import Path

for i in ["ch1", "ch2", "ch3", "ch4", "ch5", "main", "demo"]:
    for f in Path(f"workspace/{i}/imports/code").iterdir():
        shutil.copy2(f"C:/Users/ws3917/Desktop/current/{i}/{f.name}", f.resolve())
        print(f"Copied: {f.name}")
