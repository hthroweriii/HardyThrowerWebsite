#IIS (Powershell)
ECHO "Setting Up CodeDeploy"
Import-Module AWSPowerShell
powershell.exe -Command Read-S3Object -BucketName aws-codedeploy-us-east-2 -Key latest/codedeploy-agent.msi -File c:\temp\codedeploy-agent.msi
c:\temp\codedeploy-agent.msi /quiet /l c:\temp\host-agent-install-log.txt
ECHO "Setting up IIS"
Install-WindowsFeature -name Web-Server -IncludeManagementTools

ECHO "Setting up .NET tools"
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile("https://dot.net/v1/dotnet-install.ps1","C:\temp\dotnet-install.ps1")
$WebClient.DownloadFile("https://download.visualstudio.microsoft.com/download/pr/ff658e5a-c017-4a63-9ffe-e53865963848/15875eef1f0b8e25974846e4a4518135/dotnet-hosting-3.1.3-win.exe","C:/temp/dotnet-hosting.exe") 
#This version installs to C:\Users\Administrator\AppData\Local\Microsoft\dotnet\
C:/temp/dotnet-install.ps1
C:/temp/dotnet-hosting.exe -ArgumentList '/S' -PassThru
ECHO "Set up HardyWebsite"  
C:\Windows\System32\inetsrv\appcmd.exe add site /name:HardyWebsite /bindings:"http/*:81:" /physicalPath:"C:\HardyWebsite\publish" 
ECHO "We did it! YAY!"