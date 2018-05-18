# tunnelCheck
# ============

# Settings
IP_CHECK=http://ipinfo.io/ip
PORT_FORWARD=

# Script Starts
if ! [ -x "$(command -v nmap)" ]; then
	echo "Installing nmap ..."
	apt-get -qq update
	apt-get -qq install nmap
else
	echo "nmap already exists ..."
fi

VPN_ADDR=`ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`
VPN_RESP=`curl -sS --interface tun0 $IP_CHECK`
VPN_PORT=`if [ "$PORT_FORWARD" != "" ]; then if nmap -p $PORT_FORWARD $VPN_ADDR | grep -q "open"; then echo "open"; else echo "closed"; fi; else echo "not set"; fi`

echo "Interface IP is "$VPN_ADDR
echo "API Query IP is "$VPN_RESP
echo "Network Port is "$VPN_PORT

if [ "$VPN_ADDR" != "$VPN_RESP" ] || [ "$VPN_PORT" == "closed" ]; then
    echo "Killing OpenVPN"
	killall -SIGINT openvpn
else
	echo "VPN is already working!"
fi

exit 0
