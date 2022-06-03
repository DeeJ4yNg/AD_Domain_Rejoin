$Key = New-Object Byte[] 32
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($Key)
$Key | Out-File "AES.key"

Write-Host "Please enter your password:"
$securestring = Read-Host -AsSecureString
$key = Get-Content "AES.key"
$standardstring = convertfrom-securestring  $securestring -key $key
Write-Host $standardstring
$standardstring | Set-Content "Secret.txt"

$PWD = ConvertTo-SecureString $standardstring -Key $key
Write-Host $PWD