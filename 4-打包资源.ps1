# 4-打包资源.ps1
# 运行此脚本前请先安装 DotNet SDK 10
Write-Host "Building dotnet project..."
dotnet build -c Release src
dotnet src/bin/Release/net10.0/deltarunePacker.dll workspace
