
# ToggleRecycleBinVisibility

This PowerShell script, `ToggleRecycleBinVisibility.ps1`, allows users to easily hide or show the Recycle Bin icon on the Windows desktop.

## Functionality

- The script can hide or show the Recycle Bin icon on the desktop.

## Usage

### Hide Recycle Bin

To hide the Recycle Bin, simply run the script without any parameters:

```
.\ToggleRecycleBinVisibility.ps1
```

### Show Recycle Bin

To show the Recycle Bin, run the script with the `-Restore` parameter:

```
.\ToggleRecycleBinVisibility.ps1 -Restore
```

## Requirements

- PowerShell 7.0 or higher.
- Administrative privileges.

## Disclaimer

This script modifies registry settings. Incorrect modifications of the registry can cause serious problems. Please ensure you understand the implications of changes you are making.
