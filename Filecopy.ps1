enable-psremoting
Set-Item wsman:\\localhost\\Client\\TrustedHosts -Value '40.112.215.123' -Force
$userName = "azureuser"
$password = "codincity@123"
$secureCred = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $userName, $secureCred
$session = New-PSSession -ComputerName 40.112.215.123 -Credential $credential
$sourcePath = "$env:WORKSPACE/publish"
$destinationPath = "C:\Users\azureuser\Desktop\"
Invoke-Command -Session $session -ArgumentList $sourcePath, $destinationPath -ErrorVariable err_return -ScriptBlock{
#Copy-Item -Path $sourcePath -Destination $destinationPath
Copy-Item -Path $args[0] -Destination $args[1]

}
Remove-PSSession -Session $session
