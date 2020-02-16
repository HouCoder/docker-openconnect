#!/bin/sh

# Run ss servers
for config in "./ss-server/*json"
do
    ss-server -c $config -f /dev/null
done

# Read config file - https://askubuntu.com/a/743641
. ./openconnect.conf

# Start VPN
echo $PASSWORD | openconnect $HOST \
    --user=$EMAIL \
    --passwd-on-stdin \
    --servercert $CERT \
    --authgroup=$GROUP \
    # https://askubuntu.com/a/1070029
    --no-dtls \
    --background
