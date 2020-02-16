#!/bin/sh

# Run ss servers
for config in "./ss-server/*json"
do
    # https://github.com/shadowsocks/shadowsocks-libev/issues/2136
    ss-server -c $config -d 8.8.8.8 -f /dev/null
done

# Read config file - https://askubuntu.com/a/743641
. ./openconnect.conf

# Start VPN
# https://askubuntu.com/a/1070029
echo $PASSWORD | openconnect $HOST \
    --user=$EMAIL \
    --passwd-on-stdin \
    --servercert $CERT \
    --authgroup=$GROUP \
    --no-dtls
