$userName = "azureuser"
$password = "codincity@123"
$secureCred = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $userName, $secureCred
$session = New-PSSession -ComputerName 40.112.215.123 -Credential $credential
$sourcePath = "$env:WORKSPACE/publish"
$destinationPath = "C:\\Users\\azureuser\\Desktop\"
Copy-Item -Path $sourcePath -Destination $destinationPath -ToSession $session
Remove-PSSession -Session $session
