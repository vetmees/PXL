param(
    [parameter(Mandatory)] $File,
    [parameter(Mandatory)] $Path
)

if (($Path)-and($File)) {
    cd $Path
    if($File){
        Write-Output "$File bestaat!"
    }else {
        Write-Output "$File bestaat niet!"
    }
}else{
    Write-Output "error"
}