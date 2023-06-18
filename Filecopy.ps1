$userName = "azureuser"
$password = "codincity@123"
$secureCred = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $userName, $secureCred
$trustedHost = "40.112.215.123"
$session = New-PSSession -ComputerName $trustedHost -Credential $credential -Authentication Negotiate
$sourcePath = "/build"
$destinationPath = "C:\Users\azureuser\Desktop\"
Copy-Item -Path $sourcePath -Destination $destinationPath -recurse -Force -ToSession $session
Remove-PSSession -Session $session
