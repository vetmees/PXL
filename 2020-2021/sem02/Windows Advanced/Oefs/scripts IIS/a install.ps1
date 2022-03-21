Import-Module ServerManager
Add-WindowsFeature Web-Common-Http, `
    Web-Default-Doc,
    Web-Dir-Browsing, `
    Web-Static-Content, `
    Web-Stat-Compression, `
    Web-CertProvider, `
    Web-ASP, `
    Web-Asp-Net45

Remove-Item C:\inetpub\wwwroot\* -Recurse

Copy-Item -Path C:\temp\webfiles\* -Destination C:\inetpub\wwwroot -Recurse

Backup-WebConfiguration -Name IISConfigBackup
