. 'c:\Users\X-37\Downloads\WindowsHealingSystem-2026.04.26\WindowsHealingSystem-2026.04.26\Scripts\GUI\GetSystemUsesDarkMode.ps1'
$result = GetSystemUsesDarkMode
Write-Host "GetSystemUsesDarkMode returned: $result"
if ($null -eq $result) { Write-Host 'ERROR: result is null' -ForegroundColor Red }
elseif ($result -is [bool]) { Write-Host "OK - returned a bool: $result" -ForegroundColor Green }
else { Write-Host "WARNING: unexpected type $($result.GetType().Name)" -ForegroundColor Yellow }
