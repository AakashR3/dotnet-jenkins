install gss-ntlmssp
$userName = "azureuser"
$password = "codincity@123"
$secureCred = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $userName, $secureCred

# Modify the TrustedHosts list
#$trustedHost = "40.112.215.123"
#Set-Item -Path "wsman:\\localhost\Client\TrustedHosts" -Value $trustedHost -Force

$session = New-PSSession -ComputerName $trustedHost -Credential $credential
$sourcePath = "$env:WORKSPACE/publish"
$destinationPath = "D:/"

Invoke-Command -Session $session -ArgumentList $sourcePath, $destinationPath -ErrorVariable err_return -ScriptBlock {
    # Copy the item from source to destination
    Copy-Item -Path $args[0] -Destination $args[1]
}

Remove-PSSession -Session $session
