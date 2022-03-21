Import-Module ServerManager
	if(!(Test-Path 'IIS:\Sites\Default Web Site\Order')){
	New-Item 'IIS:\Sites\Default Web Site\Order' `
		-physicalPath C:\inetpub\orderapp -type VirtualDirectory
	} else {
	  Write-Output "The Order Folder has already been created."
	}
