function Show-MessageBox ($Title, $Message)
{
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
[Windows.Forms.MessageBox]::Show($Message, $Title, [Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning, [System.Windows.Forms.MessageBoxDefaultButton]::Button1, [System.Windows.Forms.MessageBoxOptions]::DefaultDesktopOnly) | Out-Null
}

Show-MessageBox "RejoinDomainTool" "ddd"
$username = "xxxxx"
$password = "xxxxx"
$pwd = $Password | ConvertTo-SecureString -asPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($UserName,$pwd)
Remove-Computer -WorkgroupName "123" -UnjoinDomainCredential $credential -PassThru -Verbose -Force -Restart