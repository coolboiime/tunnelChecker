# Set docker variables
CONTAINER_NAME=transmission-openvpn
TUNCHECKER=/data/transmission-home/tunchecker.sh

# Run tunchecker script
docker exec $CONTAINER_NAME bash $TUNCHECKER

exit 0
