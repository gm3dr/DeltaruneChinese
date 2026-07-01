# 2-下载文本.ps1

# 内部成员可以创建 secrets.ps1，输入TOKEN拉取最新文本
# $env:TOKEN = "..."
# $env:URL = "..."
if (Test-Path "secrets.ps1") { . ./secrets.ps1 }

$chapters = @("ch1", "ch2", "ch3", "ch4", "ch5")
foreach ($c in $chapters) {
    Write-Host "Downloading $c..."
    curl.exe -H "Authorization: Token $env:TOKEN" "$($env:URL)/api/translations/deltarune/$c/en/file/" -o "./workspace/$c/imports/text_src/en.json"
    curl.exe -H "Authorization: Token $env:TOKEN" "$($env:URL)/api/translations/deltarune/$c/zh_Hans/file/" -o "./workspace/$c/imports/text_src/cn.json"
}
