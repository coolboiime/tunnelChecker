# Tunnel Checker Helper
# ======================

# Set docker variables
CONTAINER_NAME=transmission-openvpn
SCRIPT_LOCATION=/data/tunnel-checker.sh

# Run tun-checker script
docker exec $CONTAINER_NAME bash $SCRIPT_LOCATION

exit 0
