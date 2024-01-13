
# Setting PowerShell Execution Policy for Unsigned Scripts

This README explains how to set the PowerShell execution policy to allow the execution of unsigned scripts.

## Understanding Execution Policies

PowerShell's execution policy is a safety feature that controls the conditions under which PowerShell loads configuration files and runs scripts. This feature helps prevent the execution of malicious scripts.

## Checking Current Execution Policy

You can check the current execution policy by running the following command in PowerShell:

```
Get-ExecutionPolicy
```

## Setting the Execution Policy


To run scripts, you might need to change the execution policy. The recommended policy to run this script is `RemoteSigned`. This policy allows running downloaded scripts that are signed by a trusted publisher.

Since the provided script is not signed, you will need to adjust the execution policy to allow unsigned scripts. The recommended required policy for this purpose is `Unrestricted`. However, please be aware that this setting lowers the security and should be used cautiously.

### Using PowerShell as an Administrator

1. Open PowerShell with administrative privileges.
2. Run the following command:

   ```
   Set-ExecutionPolicy Unrestricted
   ```

3. You will be prompted to confirm the change. Press `Y` and then Enter to confirm.

### For a Specific Scope

If you do not want to change the policy for all users, you can set it for the current user:

```
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
```

## Reverting the Execution Policy

If you want to revert your changes after running the script, use the following command:

```
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
```

## Disclaimer

Be extremely cautious when setting the execution policy to `Unrestricted`, especially when running scripts from untrusted sources. Always verify the source of the script and understand its contents before execution. It is recommended to revert to a more restrictive execution policy after running the necessary scripts.
