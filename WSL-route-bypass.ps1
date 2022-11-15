

# Old workaround
# New rules on Cisco anyconnect can force route rewrite so the following changes will be voided
# $wsl = Get-NetIPInterface -InterfaceAlias "vEthernet (WSL)" -AddressFamily IPv4
# $vpn = Get-NetIPInterface -InterfaceAlias "Ethernet 2" -AddressFamily IPv4

# $ip = Get-NetIPAddress -InterfaceAlias "vEthernet (WSL)" -AddressFamily IPv4
# $networkIp = "$($ip.IPAddress -replace "\.\d+$", ".0")"

# # Delete the associated VPN route
# Write-Output "Deleting route for $($networkIp) with index $($vpn.ifIndex)..."
# route delete $networkIp IF $vpn.ifIndex

# # Add new route for WSL
# Write-Output "Adding route for $($networkIp) with index $($wsl.ifIndex)..."
# route add $networkIp mask 255.255.240.0 0.0.0.0 IF $wsl.ifIndex metric 1

 
# New workaround
# Keep all routes, but change the interface metric for Cisco AnyConnect
Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "Cisco AnyConnect"} | Set-NetIPInterface -InterfaceMetric 6000
