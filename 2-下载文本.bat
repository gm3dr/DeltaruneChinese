@echo off
rem File: secrets.bat
rem set TOKEN=wlu_xxx
rem set URL=https://xxxx/
call secrets.bat
start curl -H "Authorization: Token %TOKEN%" %URL%/ch1/en/file/ -o ./workspace/ch1/imports/text_src/en.json
start curl -H "Authorization: Token %TOKEN%" %URL%/ch1/zh_Hans/file/ -o ./workspace/ch1/imports/text_src/cn.json
start curl -H "Authorization: Token %TOKEN%" %URL%/ch2/en/file/ -o ./workspace/ch2/imports/text_src/en.json
start curl -H "Authorization: Token %TOKEN%" %URL%/ch2/zh_Hans/file/ -o ./workspace/ch2/imports/text_src/cn.json
start curl -H "Authorization: Token %TOKEN%" %URL%/ch3/en/file/ -o ./workspace/ch3/imports/text_src/en.json
start curl -H "Authorization: Token %TOKEN%" %URL%/ch3/zh_Hans/file/ -o ./workspace/ch3/imports/text_src/cn.json
start curl -H "Authorization: Token %TOKEN%" %URL%/ch4/en/file/ -o ./workspace/ch4/imports/text_src/en.json
start curl -H "Authorization: Token %TOKEN%" %URL%/ch4/zh_Hans/file/ -o ./workspace/ch4/imports/text_src/cn.json