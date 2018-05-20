tunnelChecker
==============

This is a script in direct response to [Kristian Haugene's Transmission script](https://github.com/haugene/docker-transmission-openvpn). The script itself tries to match the IP addresses locally and remotely in addition to checking if a defined port is open. If either or fails the check, the script will kill the OpenVPN process, which shuts down the Docker container.

__In other words, this fixes a bug with `docker-transmission-openvpn`__

## Retrieve Variables
These are the descriptions of the variables that may be changed depending on your configuration. Examples are located inside the script. Please follow the exact format unless you know what you're doing. __If you need help, feel free to open an issue on GitHub!__

##### Settings (Main Script)
1. __IP_CHECK__ - Which URL to use to check your external IP address (default is http://ipinfo.io/ip)
2. __PORT_FORWARD__ - Carries an additional port forwarding check (default is empty, 51413 for Transmission default)

##### Settings (Helper Script)
1. __CONTAINER_NAME__ - The container name that the script is being ran on (default is transmission-openvpn)
2. __TUNCHECKER__ - The script location inside the Docker container (default is /data/transmission-home/tunchecker.sh)

## How to Use
1. Set the variables for the main and helper scripts.
2. Move the two files:
	- `tunchecker_helper.sh` - This file can exist anywhere accessible.
	- `tunchecker.sh` - This file should exist inside the Transmission home folder.
3. Use a task scheduler to run the helper script.

## Scenario
Since the Docker container and the host cannot necessarily communicate through the shell, the helper file runs the `docker exec` command to launch the script located inside the Transmission home folder.

Additionally, if `nmap` does not exist, which is usually the case for new script users, the script will quietly install it for the script to run properly.

## Task Scheduling
If you want to automate the script, you can use the Task Scheduler application provided inside the DiskStation Manager. Make sure the script is ran under root to prevent any issues occurring.

This script is purely useful for checking if the Docker tunnel connection is working properly, and kills OpenVPN if it doesn't. Here is one scenario where I would use it:

* Run __/volume1/tunchecker_helper.sh repair__ every 1 or 5 minutes.
