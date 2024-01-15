
# PowerShell Script to List All Installed Steam Games with Disk Space Usage

function Get-SteamGames {
    $steamPath = "$env:ProgramFiles(x86)\Steam\steamapps\common"
    if (Test-Path $steamPath) {
        $games = Get-ChildItem -Path $steamPath -Directory

        foreach ($game in $games) {
            $gamePath = $game.FullName
            $sizeBytes = (Get-ChildItem -Path $gamePath -Recurse -File | Measure-Object -Property Length -Sum).Sum
            $sizeGB = [math]::Round($sizeBytes / 1GB, 2)

            [PSCustomObject]@{
                Game = $game.Name
                Location = $gamePath
                SizeGB = $sizeGB
            }
        }
    } else {
        Write-Host "Steam installation not found at the expected location."
    }
}

# Execute the function and display results
Get-SteamGames | Format-Table -AutoSize
