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
    STIG-ID         : WN11-CC-000185

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000185.ps1 
#>

# Step 1: Set the registry path
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"

# Step 2: Create the registry key if it does not exist
New-Item -Path $RegPath -Force | Out-Null

# Step 3: Disable execution of AutoRun commands
New-ItemProperty -Path $RegPath -Name "NoAutorun" -Value 1 -PropertyType DWord -Force

# Step 4: Verify the registry setting
Get-ItemProperty -Path $RegPath -Name "NoAutorun"

# Step 5: Confirm the configured value
Get-ItemPropertyValue -Path $RegPath -Name "NoAutorun"
