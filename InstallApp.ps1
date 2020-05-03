dotnet restore

dotnet publish --configuration release -o c:\HardyWebsite\publish --runtime active

C:\Windows\SysNative\WindowsPowerShell\v1.0\powershell.exe -Command {
             Import-Module WebAdministration
             Set-ItemProperty 'IIS:sitesDefault Web Site' 
                 -Name physicalPath -Value c:\HardyWebsite\publish
}