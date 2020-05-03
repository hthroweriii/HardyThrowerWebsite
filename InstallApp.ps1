dotnet restore

dotnet publish --configuration release -o c:\HardyWebsite\publish 

C:\Windows\System32\inetsrv\appcmd.exe SET SITE "Default Web Site" /physicalPath:c:"c:\HardyWebsite\publish"

C:\Windows\SysNative\WindowsPowerShell\v1.0\powershell.exe -Command {
             Import-Module WebAdministration
             Set-ItemProperty 'IIS:sitesDefault Web Site' 
                 -Name physicalPath -Value c:\HardyWebsite\publish
}