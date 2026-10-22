 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Christopher Akpala
    LinkedIn        : linkedin.com/in/christopherakpala
    GitHub          : github.com/Kristich
    Date Created    : 2024-09-09
    Last Modified   : 2024-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000385

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000385.ps1 
#>

# Step 1: Set the registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace"

# Step 2: Create the registry key if it does not exist
New-Item -Path $RegPath -Force | Out-Null

# Step 3: Allow Windows Ink Workspace but disallow access above lock
New-ItemProperty -Path $RegPath -Name "AllowWindowsInkWorkspace" -Value 1 -PropertyType DWord -Force

# Step 4: Verify the registry setting
Get-ItemProperty -Path $RegPath -Name "AllowWindowsInkWorkspace"

# Step 5: Confirm the configured value
Get-ItemPropertyValue -Path $RegPath -Name "AllowWindowsInkWorkspace"
