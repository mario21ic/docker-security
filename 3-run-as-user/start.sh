#/bin/bash

docker build -t mario21ic/security:v3 .

docker run --user 1000 -v /root/secrets.txt:/tmp/secrets.txt mario21ic/security:v3

docker run --user 0 -v /root/secrets.txt:/tmp/secrets.txt mario21ic/security:v3

