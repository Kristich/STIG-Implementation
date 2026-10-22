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
    STIG-ID         : WN11-CC-000206

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000206.ps1 
#>

# Step 1: Set the Group Policy registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization"

# Step 2: Create the registry key if it does not exist
New-Item -Path $RegPath -Force | Out-Null

# Step 3: Set Download Mode to HTTP Only (0)
New-ItemProperty -Path $RegPath -Name "DODownloadMode" -Value 0 -PropertyType DWord -Force

# Step 4: Set the standalone configuration to Off (0)
$ConfigPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config"

New-Item -Path $ConfigPath -Force | Out-Null

New-ItemProperty -Path $ConfigPath -Name "DODownloadMode" -Value 0 -PropertyType DWord -Force

# Step 5: Verify the Group Policy registry setting
Get-ItemPropertyValue -Path $RegPath -Name "DODownloadMode"

# Step 6: Verify the standalone configuration
Get-ItemPropertyValue -Path $ConfigPath -Name "DODownloadMode"
