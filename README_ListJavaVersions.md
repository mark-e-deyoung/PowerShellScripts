
# ListJavaVersions

This PowerShell script, `ListJavaVersions.ps1`, lists all the Java versions installed on a Windows system. It checks common installation paths, user-specific program locations, and the Windows registry.

## Functionality

- The script searches in common installation paths, user-specific locations, and the Windows registry for Java.
- It lists each found Java version along with its installation path.

## Usage

To run the script, execute it in PowerShell:

```
.\ListJavaVersions.ps1
```

## Requirements

- PowerShell 7 or higher.
- Windows operating system.

## Note

- The script checks file system locations (including user-specific locations) and registry entries for Java installations.
- Administrative privileges might be required to access certain registry locations.
