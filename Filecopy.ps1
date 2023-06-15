#$session = New-PSSession -ComputerName 40.112.215.123 -Credential (Get-Credential -UserName "azureuser" -Password "codincity@123")
$userName = "azureuser"
$password = "codincity@123"
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $userName, $password
$session = New-PSSession -ComputerName 40.112.215.123 -Credential $credential
$sourcePath = "$env:WORKSPACE/publish"
$destinationPath = "C:\\Users\\azureuser\\Desktop\"
Copy-Item -Path $sourcePath -Destination $destinationPath -ToSession $session
Remove-PSSession -Session $session

