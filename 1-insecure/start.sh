#/bin/bash

docker build -t mario21ic/security .
docker run -v /root/secrets.txt:/tmp/secrets.txt mario21ic/security
