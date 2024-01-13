
# ModifyUserPath

This PowerShell script, `ModifyUserPath.ps1`, is designed to add or remove a specified directory to/from the user's PATH environment variable in PowerShell 7.

## Functionality

- By default, the script adds a 'Bin' directory (`$HOME\Bin`) to the PATH.
- Optionally, a custom path can be specified as a command line argument.
- A switch parameter is provided to remove the specified path from the PATH.

## Usage

1. To add the default 'Bin' directory in the user's home to the PATH:
   ```
   .\ModifyUserPath.ps1
   ```

2. To add a custom path:
   ```
   .\ModifyUserPath.ps1 -PathToModify "C:\Your\Custom\Path"
   ```

3. To remove the default 'Bin' directory from the PATH:
   ```
   .\ModifyUserPath.ps1 -Remove
   ```

4. To remove a custom path:
   ```
   .\ModifyUserPath.ps1 -PathToModify "C:\Your\Custom\Path" -Remove
   ```

## Requirements

- PowerShell 7 or higher.

## Note

- Ensure that the custom path provided is valid and correctly formatted.
- This script modifies the user's PATH environment variable and should be used with understanding of the implications.
