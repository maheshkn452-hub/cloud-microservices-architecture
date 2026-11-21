# Active Directory Automation Script - Lab 1 (lab.local)
# Creates service accounts and security groups for IIS and SQL Server integration

Import-Module ActiveDirectory

# 1. Create Security Groups
New-ADGroup -Name "IIS_AppPool_Users" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "SQL_DB_Admins" -GroupScope Global -GroupCategory Security

# 2. Define Service Accounts
$Password = ConvertTo-SecureString "P@ssw0rd123!" -AsPlainText -Force

New-ADUser -Name "svc_iis_contoso" `
           -SamAccountName "svc_iis_contoso" `
           -UserPrincipalName "svc_iis_contoso@lab.local" `
           -AccountPassword $Password `
           -Enabled $true `
           -PasswordNeverExpires $true

New-ADUser -Name "svc_sql_contoso" `
           -SamAccountName "svc_sql_contoso" `
           -UserPrincipalName "svc_sql_contoso@lab.local" `
           -AccountPassword $Password `
           -Enabled $true `
           -PasswordNeverExpires $true

# 3. Add Service Accounts to Security Groups
Add-ADGroupMember -Identity "IIS_AppPool_Users" -Members "svc_iis_contoso"
Add-ADGroupMember -Identity "SQL_DB_Admins" -Members "svc_sql_contoso"

Write-Host "Active Directory service accounts and groups configured successfully." -ForegroundColor Green