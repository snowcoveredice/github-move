# Powershell additions

`profile.ps1`
```
Write-Host “Loading Custom PowerShell Environment” 
Get-ChildItem c:\powershell\*.ps1 | %{.$_}
Write-Host “Custom PowerShell Environment Loaded” 
```