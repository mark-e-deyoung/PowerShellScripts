
# ListJavaVersions

This PowerShell script, `ListJavaVersions.ps1`, lists all the Java versions installed on a Windows system, including those identified via the registry.

## Functionality

- The script searches common installation paths and the Windows registry for Java.
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

- The script checks both file system locations and registry entries for Java installations.
- Administrative privileges might be required to access certain registry locations.
