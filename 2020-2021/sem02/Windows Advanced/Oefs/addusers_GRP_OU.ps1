Import-Module ActiveDirectory

[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

$dialog = New-Object System.Windows.Forms.OpenFileDialog
$dialog.InitialDirectory = $StartDir
$dialog.Filter  ="CSV (*.csv)| *.csv"
$dialog.ShowDialog() | Out-Null

$CSVFile = $dialog.FileName

if([System.IO.File]::Exists($CSVFile)){
    Write-Host "Importing CSV..."
    $CSV = Import-Csv -LiteralPath "$CSVFile"
} else {
    Write-Host "File path specified was not valid"
    exit
}

foreach ($line in $CSV){
# make OU
$parentOU = Get-ADDomain
$OU = $line.'OU'
$newOU = "OU=$OU,$parentOU"
try{
    if((Get-ADOrganizationalUnit -Filter 'Name -like $OU') -eq $null){
        $OUExists = $false
    }
    
}
catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException]{
    $OUExists = $true
}
if($OUExists){
    Write-Host "$newOU already exists"
} else {
    New-ADOrganizationalUnit -Name $OU -Path $parentOU
    $OUExists = $true
}

#make group
$currentDomain = Get-ADDomain
$targetOU = "OU="+$line.'OU'+","+$currentDomain
$grpName = $line.'GROUP'

#Check if group exists
try{
    Get-ADGroup -Identity $grpName
    $groupExists = $true
}
catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException]{
    $groupExists = $false
}

#make group if not exists
if($groupExists){
    Write-Host "Group already exists"
} else {
    New-ADGroup -Name $grpName -GroupScope Global -GroupCategory Security -Path $targetOU -SamAccountName $grpName -Server "server.ABC.com"
    $groupExists = $true
}


#pass
$password = ConvertTo-SecureString "Pxl-2021" -AsPlainText -Force

$username = "$($line.'USER')"
$username = $username.Replace(" ","")
$userMail = "$($username)@ABC.COM"


#create user

try{
    Get-ADUser -Identity $username
    $userExists = $true
}
catch [Microsoft.ActiveDirectory.Management.ADIdentityResolutionException]{
    $userExists = $false
}

if($userExists){
    Write-Host "user already exists"
}else{
    New-ADUser -Name $username `
            -GivenName $username `
            -UserPrincipalName "$username@ABC.COM" `
            -SamAccountName $username `
            -Path $targetOU `
            -ChangePasswordAtLogon $false `
            -AccountPassword $password `
            -Enabled $true

    $userExists = $true
}

#add user to group
if($line.'GROUP' -ne ""){
    $line.'GROUP'.split(",") | foreach {
        Add-ADGroupMember -Identity $_ -Members $username
        Write-Host "addedd $username to $_ group"
    }
}

}
