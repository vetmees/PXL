Clear-Host
$dag = Get-Date -Format "dddd" 
switch($dag){
Monday{Write-Host "het is geen weekend"}
Tuesday{Write-Host "het is geen weekend"}
Wednesday{Write-Host "het is geen weekend"}
Thursday{Write-Host "het is geen weekend"}
Friday{Write-Host "het is geen weekend"}
Saturday{Write-Host "het is weekend"}
Sunday{Write-Host "het is weekend"}
}