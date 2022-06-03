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
$Domain = "cn.kworld.kpmg.com"
Add-Computer -DomainName $Domain -Credential $credential
Set-ItemProperty -path HKLM:\system\CurrentControlSet\Services\tcpip\parameters -Name "NV Domain" -Value "clients.cn.kworld.kpmg.com"
#Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce -Name "MoveOU" -Value """C:\temp\DomainRejoin\Move OU\runas.vbe"" -show"""
Start-Process -FilePath "$criptRoot\Move OU\runas.vbe" -WindowStyle Hidden -wait -Passthru
gpupdate /force
Show-MessageBox "RejoinDomainTool" "ddd"