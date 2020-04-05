FROM ubuntu:bionic

RUN apt-get update && apt-get install -y bind9 bind9utils vim dnsutils

# Copy configuration files
COPY named.conf.options /etc/bind/
COPY named.conf.local /etc/bind/
COPY db.atlas.birddogsw.local /etc/bind/zones/

CMD ["/usr/sbin/named", "-f", "-4"]
# CMD ["/bin/bash", "-c", "while :; do sleep 10; done"]