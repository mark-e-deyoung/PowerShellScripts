# DiskSpaceReport PowerShell Script

## Overview
`DiskSpaceReport.ps1` is a PowerShell script that mimics the functionality of the Unix `df` command. It reports disk space usage on a Windows system, showing total space, used space, available space, and the use percentage for each filesystem drive. The default output is in gigabytes (GB).

## Requirements
- PowerShell 7 or later.

## Usage
Run the script in PowerShell with optional flags to specify the unit of measurement:
- No flags: Display disk space in gigabytes.
- `-h`: Human-readable format.
- `-k`: Display disk space in kilobytes.
- `-m`: Display disk space in megabytes.
- `-B [size]`: Display disk space in custom block size (in bytes).

Example:
