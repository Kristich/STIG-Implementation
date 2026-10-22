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
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AU-000065.ps1 
#>

# Step 1: Set the registry path
$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"

# Step 2: Enable advanced audit policy enforcement (WN11-SO-000030)
New-ItemProperty -Path $RegPath -Name "SCENoApplyLegacyAuditPolicy" -Value 1 -PropertyType DWord -Force

# Step 3: Enable Audit Logoff - Success
auditpol.exe /set /subcategory:"Logoff" /success:enable

# Step 4: Verify Logoff auditing
auditpol.exe /get /subcategory:"Logoff"

# Step 5: Verify the registry setting
Get-ItemPropertyValue -Path $RegPath -Name "SCENoApplyLegacyAuditPolicy"
