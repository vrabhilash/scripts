Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -ArgumentList '/I AzureCLI.msi /quiet' -Wait; Remove-Item .\AzureCLI.msi
curl.exe -LO "https://dl.k8s.io/release/v1.31.0/bin/windows/amd64/kubectl.exe"
Move-Item .\kubectl.exe "C:\Windows\"
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -name "PortNumber" -Value '443'
New-NetFirewallRule -DisplayName "RDPPORTLatest-TCP-In" -Profile "Public" -Direction Inbound -Action Allow -Protocol TCP -LocalPort '443'
New-NetFirewallRule -DisplayName "RDPPORTLatest-UDP-In" -Profile "Public" -Direction Inbound -Action Allow -Protocol UDP -LocalPort '443'
$chromeInstallerUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$installerPath = "$env:TEMP\chrome_installer.exe"
Invoke-WebRequest -Uri $chromeInstallerUrl -OutFile $installerPath
Start-Process -FilePath $installerPath -ArgumentList "/silent /install" -Wait
Remove-Item -Path $installerPath -Force

Restart-Computer -Force
