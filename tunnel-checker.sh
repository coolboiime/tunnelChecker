# Tunnel Checker
# ===============

wget -q --spider http://ipinfo.io/ip

if [ $? -eq 0 ]; then
	echo "Internet connection is online ..."
else
	echo "Internet connection is offline ..."
	pkill -SIGINT openvpn
fi
