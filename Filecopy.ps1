winrm s winrm/config/client '@{TrustedHosts="RemoteComputer"}'

$userName = "azureuser"
$password = "codincity@123"
$secureCred = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $userName, $secureCred

$remoteHost = "remotehost"
$session = New-PSSession -ComputerName $remoteHost -Credential $credential -Authentication Negotiate

$sourcePath = "$env:WORKSPACE/publish"
$destinationPath = "D:/"

Invoke-Command -Session $session -ArgumentList $sourcePath, $destinationPath -ErrorVariable err_return -ScriptBlock {
    # Copy the item from source to destination
    Copy-Item -Path $args[0] -Destination $args[1]
}

Remove-PSSession -Session $session
