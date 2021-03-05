function quit_ {
  Write-Output @("", "press Enter to quit.")
  $foo = $host.UI.RawUI.ReadKey()
  exit
}

# 管理者権限の確認
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$admin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (!$admin) {
  Write-Output("Please 'run as administrator' by right click.")
  quit_;
}

# ctfmon.exeの再起動
Write-Output('> tasklist /fi "imagename eq ctfmon.exe"')
tasklist /fi "imagename eq ctfmon.exe"
Write-Output("")
Start-Sleep 5

$csv = tasklist /fi "imagename eq ctfmon.exe" /fo csv
$old = $csv | ConvertFrom-CSV
Write-Output("> taskkill /pid {0}" -f $old.PID)
taskkill /pid $old.PID
Start-Sleep 5

$csv = tasklist /fi "imagename eq ctfmon.exe" /fo csv
$new = $csv | ConvertFrom-CSV

if ($new -eq $null) {
  Write-Output("> ctfmon.exe");
  ctfmon.exe
} else {
tasklist /fi "imagename eq ctfmon.exe"
}

quit_
