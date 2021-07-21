<#
.SYNOPSIS
Copies all the cheat tables into `$HOME/Documents/My Cheat Tables/`.
#>

$tablePath="$HOME/Documents/My Cheat Tables/"
if (!(Test-Path $tablePath -PathType Container)) {
    New-Item $tablePath -ItemType Directory | Out-Null
}

Remove-Item "$tablePath/*" -Recurse -Force
Get-ChildItem -Recurse -Filter '*.ct' | ForEach-Object {
    Copy-Item $_.FullName $tablePath
}
