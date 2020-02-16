# docker-openconnect

Convert openconnect VPN connection to Shadowsocks server connections to avoid all network traffics going through VPN connection.

## Setup

1. Clone this repo
2. `$ mv openconnect.conf.example openconnect.conf`
3. Fill all the informations in openconnect.conf, todo - get CERT option
4. Create Shadowsocks server config files in `ss-server` folder, here is how - https://shadowsocks.org/en/config/quick-guide.html
5. Build image `$ docker build -t docker-openconnect .`
6. Run image `$ docker run -it --privileged --rm docker-openconnect`

## Troubleshoots

### 1. Server SSL certificate didn't match

```
Server certificate verify failed: signer not found
Server SSL certificate didn't match: XXXXXXXXXXXXXXXXXXXXXXXX
SSL connection failure: Error in the certificate.
Failed to open HTTPS connection to connect.example.com
Failed to obtain WebVPN cookie
```

Need to update SSL signature in openconnect.conf file.

### 2. Resource temporarily unavailable

```
Username:fgets (stdin): Resource temporarily unavailable
```

Change your password and try again later.

## Links

1. https://stackoverflow.com/a/30555962
2. https://askubuntu.com/a/1070029
