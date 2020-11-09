# Set docker variables
CONTAINER_NAME=transmission-openvpn
TUN_CHECKER=/data/transmission-home/tun-checker.sh

# Run tun_checker script
docker exec $CONTAINER_NAME bash $TUN_CHECKER

exit 0
