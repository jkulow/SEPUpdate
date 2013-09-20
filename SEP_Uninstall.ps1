$hostname = hostname
$a = Get-WmiObject -computername $hostname -Class Win32_Product |Where-Object { $_.Name -match "Symantec Endpoint Protection"}
if ($a.Path -notlike "*Version=`"12.1.671.4971`"") {
    & 'C:\Program Files\Symantec\Symantec Endpoint Protection\Smc.exe' -stop -p uninstallPassword
    sleep 5
    remove-itemproperty -path 'hklm:\Software\Symantec\Symantec Endpoint Protection\SMC' -Name smc_exit_test
	remove-itemproperty -path 'hklm:\Software\Symantec\Symantec Endpoint Protection\SMC' -Name SmcInstData
    New-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce -Name SEPInstall -Value "<PATH TO THE NEW SEP INSTALLER>"
    $a.Uninstall()
}
ELSE {write-host "The newest version of SEP 12.1.671.4971 is already installed. Exiting..." -Fore Green}