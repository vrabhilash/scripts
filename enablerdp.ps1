Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -name "PortNumber" -Value '443'

New-NetFirewallRule -DisplayName "RDPPORTLatest-TCP-In" -Profile "Public" -Direction Inbound -Action Allow -Protocol TCP -LocalPort '443'
New-NetFirewallRule -DisplayName "RDPPORTLatest-UDP-In" -Profile "Public" -Direction Inbound -Action Allow -Protocol UDP -LocalPort '443'
Restart-Computer -Force
