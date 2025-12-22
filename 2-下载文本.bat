@echo off
set TOKEN=wlu_pI3gqtECKsngOn8V9ju78Sba4erdJnKPbqPg
set URL=https://122.152.232.88/api/translations/deltarune
start curl -H "Authorization: Token %TOKEN%" %URL%/ch1/en/file/ -o ./workspace/ch1/imports/text_src/en.json
start curl -H "Authorization: Token %TOKEN%" %URL%/ch1/zh_Hans/file/ -o ./workspace/ch1/imports/text_src/cn.json
start curl -H "Authorization: Token %TOKEN%" %URL%/ch2/en/file/ -o ./workspace/ch2/imports/text_src/en.json
start curl -H "Authorization: Token %TOKEN%" %URL%/ch2/zh_Hans/file/ -o ./workspace/ch2/imports/text_src/cn.json
start curl -H "Authorization: Token %TOKEN%" %URL%/ch3/en/file/ -o ./workspace/ch3/imports/text_src/en.json
start curl -H "Authorization: Token %TOKEN%" %URL%/ch3/zh_Hans/file/ -o ./workspace/ch3/imports/text_src/cn.json
start curl -H "Authorization: Token %TOKEN%" %URL%/ch4/en/file/ -o ./workspace/ch4/imports/text_src/en.json
start curl -H "Authorization: Token %TOKEN%" %URL%/ch4/zh_Hans/file/ -o ./workspace/ch4/imports/text_src/cn.json