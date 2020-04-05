BUILD:
docker build -t bind9 .

RUN:
docker run -p 53:53/tcp -p 53:53/udp -d --rm --name=dns-server bind9

REFRESH WHEN MAKING CHANGES TO THE LOCAL FILES:
to refresh things:
docker kill dns-server; docker build -t bind9 .; docker run -p 53:53/tcp -p 53:53/udp -d --rm -name=dns-server bind9

GET ONTO THE CONTAINER:
docker exec -it dns-server /bin/bash

TAIL THE BIND9 LOGS:
docker exec -it dns-server tail -f /tmp/bind.log

TESTS FROM THE DOCKER HOST:
nslookup demoalias.atlas.birddogsw.local 127.0.0.1
nslookup www.google.com 127.0.0.1
nslookup www.birddogsw.com 127.0.0.1