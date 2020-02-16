# docker-openconnect

Convert openconnect VPN connection to Shadowsocks server connections to avoid all network traffics going through VPN connection.

## Setup

Readlly simple, just 5 steps!

1. Clone this repo
2. Build image `$ docker build -t docker-openconnect .`
3. `$ mv openconnect.conf.example openconnect.conf`
4. [Get CERT option's value](#get-cert-options-value) and fill all the informations in openconnect.conf
5. `$ docker-compose up -d`

## Get CERT option's value

In this case `sha256:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx` is the `CERT` option's value.

```
➜  ~ docker run -it --rm docker-openconnect openconnect connect.example.com
POST https://connect.example.com/
Connected to 8.8.8.8:443
SSL negotiation with connect.example.com
Server certificate verify failed: signer not found

Certificate from VPN server "connect.example.com" failed verification.
Reason: signer not found
To trust this server in future, perhaps add this to your command line:
    --servercert sha256:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Enter 'yes' to accept, 'no' to abort; anything else to view:
```

## Add more ss servers

Just create more json configurations in `ss-server` folder and update the `PORTS` option in `docker-compose.yml`.

## Troubleshoots

### 1. Server SSL certificate didn't match

```
Server certificate verify failed: signer not found
Server SSL certificate didn't match: XXXXXXXXXXXXXXXXXXXXXXXX
SSL connection failure: Error in the certificate.
Failed to open HTTPS connection to connect.example.com
Failed to obtain WebVPN cookie
```

Need to update SSL signature in openconnect.conf file, [Get CERT option's value](#get-cert-options-value).

### 2. Resource temporarily unavailable

```
Username:fgets (stdin): Resource temporarily unavailable
```

Change your password and try again later.

## Links

1. https://stackoverflow.com/a/30555962
2. https://askubuntu.com/a/1070029
