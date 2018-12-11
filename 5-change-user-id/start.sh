#/bin/bash

docker build -t mario21ic/security:v5 .

docker run -e DEV_UID=$(id -u) -e DEV_GID=$(id -g) -v /root/secrets.txt:/tmp/secrets.txt mario21ic/security:v5 cat /tmp/secrets.txt
