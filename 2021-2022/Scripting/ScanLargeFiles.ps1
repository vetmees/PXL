Param (
    $Path ,
    $MinimumSize,
    [switch]$ShowTotalBytes,
    [switch]$Help
)
if($Help){
    Write-Output "ScanLargeFiles.ps1
    Telt en toont het aantal files groter of gelijk aan dan de MinimumSize parameter, recursief geteld vanaf de meegegeven locatie in -Path.
    
    Parameters:
    -Help             toont deze Help informatie
    -Path             pad vanaf waar recursief scand wordt
    -MinimumSize      enkel files groter of gelijk aan de MinimumSize worden geteld
                      default value: 100000 bytes
    -ShowTotalBytes   toont eveneens het totale aantal bytes van de getelde files"
}else{
    if($MinimumSize){
    }else{
        $MinimumSize = 100000
    }
        if(($Path) -and (Test-Path -Path "$Path")){
            $output = Get-ChildItem "$Path" -File | Where-Object {$_.Length -gt $MinimumSize} | Measure-Object
            $bytes = Get-ChildItem "$Path" -File | Where-Object {$_.Length -gt $MinimumSize} | Measure-Object Length -Sum
            if($ShowTotalBytes){
                Write-Output "Je hebt $($output.Count) grote file(s) in $Path"
                Write-Output "Totaal aantal bytes: $($bytes.Sum)"
            }else{
                Write-Output "Je hebt $($output.Count) grote file(s) in $Path"
            }    
        }else{
            Write-Output "ERROR: ongeldig pad meegegeven"
    }
}   
