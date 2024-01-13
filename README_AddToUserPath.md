
# AddToUserPath

This PowerShell script, `AddToUserPath.ps1`, adds a specified directory to the user's PATH environment variable in PowerShell 7. By default, it adds a 'Bin' directory located in the user's home directory.

## Functionality

- By default, the script adds a 'Bin' directory (`$HOME\Bin`) to the PATH.
- Optionally, a custom path can be specified as a command line argument.

## Usage

1. To add the default 'Bin' directory in the user's home to the PATH:
   ```
   .\AddToUserPath.ps1
   ```

2. To add a custom path:
   ```
   .\AddToUserPath.ps1 -PathToAdd "C:\Your\Custom\Path"
   ```

## Requirements

- PowerShell 7 or higher.

## Note

- Ensure that the custom path provided is valid and correctly formatted.
- This script modifies the user's PATH environment variable and should be used with understanding of the implications.
