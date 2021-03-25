Import-Module ActiveDirectory

[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

$dialog = New-Object System.Windows.Forms.OpenFileDialog
$dialog.InitialDirectory = $StartDir
$dialog.Filter = "CSV (*.csv)| *.csv"
$dialog.ShowDialog() | Out-Null

$CSVFile = $dialog.FileName

if([System.IO.File]::Exists($CSVFile)){
    Write-Host "Importing CSV..."
    $CSV = Import-Csv -LiteralPath "$CSVFile"
} else {
    Write-Host "file path specified was not valid"
    exit
}

foreach($user in $CSV){
    
    #passwd
    $standardPasswd = ConvertTo-SecureString "SNE2021" -AsPlainText -Force

    #get username & parse into loginName
    $Username = "$($user.'First Name').$($user.'Last Name')"
    $Username = $Username.Replace(" ","")
    $UserMail = "$($Username)@ssol.local"

   

    #create AD user
    New-ADUser -Name "$($user.'First Name') $($user.'Last Name')" `
                -GivenName $user.'First Name' `
                -Surname $user.'Last Name' `
                -UserPrincipalName "$Username@ssol.local" `
                -SamAccountName $Username `
                -EmailAddress $UserMail `
                -Description "$($user.'Job Title') created with powershell"`
                -OfficePhone $user.'Office Phone' `
                -Path "$($user.'Organizational Unit')" `
                -ChangePasswordAtLogon $true `
                -AccountPassword $standardPasswd `
                -Enabled $([System.Convert]::ToBoolean($user.'Enabled'))`
                -HomeDirectory "\\team14DC2\Home\$Username"`
                -HomeDrive "H:"
           

    #create homefolder
    $Path = "\\team14DC2\Home\"
    $folder = "\\team14DC2\Home\$Username"
    New-Item -ItemType Directory -Path $Path$Username

    #set ACL Permissions
    $Acl = Get-Acl $folder
    $acl.SetOwner([System.Security.Principal.NTAccount] $env:USERNAME)
    Set-Acl $folder $acl | Out-Null
    $acl.SetAccessRuleProtection($true, $false)
    set-acl $folder $acl | Out-Null
    $ar = New-Object System.Security.AccessControl.FileSystemAccessRule("$Username", "FullControl", "Allow")
    $acl.SetAccessRule($ar)
    Set-Acl $folder $acl | Out-Null
    $ar2 = New-Object System.Security.AccessControl.FileSystemAccessRule("Administrators","FullControl","Allow")
    $acl.SetAccessRule($ar2)
    Set-Acl $folder $acl | Out-Null



        Write-Host "created $Username / $UserMail"


        #groups toevoegen
        if($user.'AddToGroups' -ne ""){
            $user.'AddToGroups'.split(",") | foreach {
                Add-ADGroupMember -Identity $_ -Members "$($user.'First Name').$($user.'Last Name')"
                Write-Host "Added $Username to $_ group"
            }
        }

        Write-Host "created user $Username with groups $($user.'AddToGroups')"

}
Read-Host -Prompt "Script complete... press enter to exit."
