#/bin/bash

docker build -t mario21ic/security:v1 .
docker run -v /root/secrets.txt:/tmp/secrets.txt mario21ic/security:v1
