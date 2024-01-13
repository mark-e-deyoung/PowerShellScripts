
# ToggleFileNameLengthLimit

This PowerShell script, `ToggleFileNameLengthLimit.ps1`, allows users to enable or disable the 260-character file name length limit in Windows.

## Functionality

- By default, the script enables support for file paths longer than 260 characters.
- Run with the `-Restore` switch to revert to the default 260-character limit.

## Usage

### Enable Long Path Support

To enable long path support (allowing more than 260 characters in file paths), run the script without parameters:

```
.\ToggleFileNameLengthLimit.ps1
```

### Disable Long Path Support

To disable long path support and restore the 260-character limit:

```
.\ToggleFileNameLengthLimit.ps1 -Restore
```

## Requirements

- PowerShell 7 or higher.
- Administrative privileges.

## Disclaimer

Modifying registry settings can have unintended side effects. Please ensure you understand the implications of changes you are making.
