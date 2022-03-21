if(Get-Service -Name "WSearch"| Where-Object {$_.Status -eq "Running"}){
    Write-Output "WSearch service is running"
}else{
    Write-Output "WSearch service has stopped"
}