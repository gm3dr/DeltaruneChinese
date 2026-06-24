# 4-打包资源.ps1
if (-not (Test-Path -Path src/bin)) {
    Write-Host "Building dotnet project..."
    dotnet build -c Release src
}
dotnet src/bin/Release/net10.0/deltarunePacker.dll workspace
