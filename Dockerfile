FROM ubuntu:latest

RUN apt-get update && apt-get install openconnect shadowsocks-libev -y

WORKDIR /app

COPY . /app

CMD ["./vpn.sh"]
