#Join domain
function Show-MessageBox ($Title, $Message)
{
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
[Windows.Forms.MessageBox]::Show($Message, $Title, [Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning, [System.Windows.Forms.MessageBoxDefaultButton]::Button1, [System.Windows.Forms.MessageBoxOptions]::DefaultDesktopOnly) | Out-Null
}

Show-MessageBox "RejoinDomainTool" "ddd"
$GLOBAL:criptRoot = Split-Path -Path $MyInvocation.MyCommand.Definition -parent
$username = "xxx"
$pwd = Get-Content "Secret.txt" | ConvertTo-SecureString -Key (Get-Content "AES.key")
$credential = New-Object System.Management.Automation.PSCredential($UserName,$pwd)
$Domain = "xxxxx.com"
Add-Computer -DomainName $Domain -Credential $credential
gpupdate /force
Show-MessageBox "RejoinDomainTool" "ddd"
