
# ToggleOneDriveVisibility

This PowerShell script allows users to easily hide or unhide the OneDrive icon in Windows File Explorer.

## Usage

The script can be run in two modes: hiding OneDrive or unhiding OneDrive.

### Hide OneDrive

To hide OneDrive, simply run the script without any parameters:

```
.\ToggleOneDriveVisibility.ps1
```

### Unhide OneDrive

To unhide OneDrive, run the script with the `-Restore` parameter:

```
.\ToggleOneDriveVisibility.ps1 -Restore
```

## Requirements

- PowerShell 7.0 or higher
- Administrative privileges

## Disclaimer

Modifying the Windows Registry can have unintended side effects, including making the system unstable or unbootable. Always ensure you have backups and understand the implications of changes you are making.
