
# PowerShell Script to List All Installed Steam Games with Disk Space Usage

function Get-SteamGames {
    # Finding the Steam installation path from the registry
    try {
        $steamPathReg = Get-ItemProperty "HKCU:\Software\Valve\Steam"
        $steamPath = $steamPathReg.SteamPath
    } catch {
        Write-Host "Unable to find Steam installation in the registry."
        return
    }

    # Constructing the path to the 'steamapps' directory
    $steamAppsPath = Join-Path -Path $steamPath -ChildPath "steamapps\common"

    if (Test-Path $steamAppsPath) {
        $games = Get-ChildItem -Path $steamAppsPath -Directory

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
        Write-Host "Steam games directory not found at the expected location."
    }
}

# Execute the function and display results
Get-SteamGames | Format-Table -AutoSize
