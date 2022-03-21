Clear-Host
[int]$invoer = Read-Host "Geef je leeftijd:"
if ($invoer -lt 16){
Write-Host "jonger dan 16"}
elseif (($invoer -gt 16) -and ($invoer -lt 25)){
Write-Host "Jonger dan 25"}
elseif (($invoer -gt 25) -and ($invoer -lt 40)){
Write-Host "Jonger dan 40"}
elseif ($invoer -gt 40){
Write-Host "Ouder dan 40"}
else {
Write-Host "foutieve invoer"}