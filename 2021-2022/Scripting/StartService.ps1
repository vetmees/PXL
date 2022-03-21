Param(
    [parameter(Mandatory)]$ServiceName,
    [switch]$AskUser
)
Write-Output "$ServiceName"
if($AskUser){
    Write-Output "BOOM!"
}


if(Get-Service -Name $ServiceName| Where-Object {$_.Status -eq "Running"}){
    Write-Output "$ServiceName service is running"
}else{
    if($AskUser){
        $accept = Read-Host "Do you want to start serice $ServiceNaam y/n?"
        if ($accept -eq "y"){
            Start-Service -Name $ServiceName
            Write-Output "strated service"
        }else {
            exit
        }
    }else{
        Start-Service -Name $ServiceName
        Write-Output "strated service"
    }
}