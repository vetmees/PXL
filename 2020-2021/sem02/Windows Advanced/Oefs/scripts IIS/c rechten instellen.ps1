$Right="ReadAndExecute"
$Principal = "IIS_IUSRS"
$StartingDir = "c:\inetpub\wwwroot"

foreach ($file in $(Get-ChildItem $StartingDir -recurse)) {
	$rule=new-object System.Security.AccessControl.FileSystemAccessRule($Principal,$Right,"Allow")
    
    $acl=Get-Acl $file.FullName

    Write-Output $file.FullName

    $acl.SetAccessRule($rule)

    Set-Acl $File.Fullname $acl

}
