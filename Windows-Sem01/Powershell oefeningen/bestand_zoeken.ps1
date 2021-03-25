Clear-Host
[string]$invoer = Read-Host "geef een bestandsnaam op"
$zoek = Get-ChildItem -Path c:\$invoer 
if($zoek -ne $null){
Write-Host "het bestand bestaat"}
else{
$ErrorAction = "ignore"}