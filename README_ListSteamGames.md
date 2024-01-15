
# ListSteamGames

This updated PowerShell script, `ListSteamGames.ps1`, lists all installed Steam games, including their installation location and disk space usage, by querying the Steam installation location from the registry.

## Functionality

- The script finds the Steam installation path from the registry.
- It searches the Steam games directory for installed games.
- It lists each game's name, location, and size in gigabytes.

## Usage

To run the script, execute it in PowerShell:

```
.\ListSteamGames.ps1
```

## Requirements

- PowerShell 7 or higher.
- Steam must be installed, and the registry path to Steam must be available.

## Note

- Ensure that Steam is installed correctly, and the registry entry for Steam is intact for the script to work properly.
