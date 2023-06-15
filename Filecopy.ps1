$session = New-PSSession -ComputerName 40.112.215.123 -Credential (Get-Credential -UserName "azureuser" -Password "codincity@123")
$sourcePath = Join-Path $env:WORKSPACE "publish"
$destinationPath = "C:\\Users\\azureuser\\Desktop\"
Copy-Item -Path $sourcePath -Destination $destinationPath -ToSession $session
Remove-PSSession -Session $session
