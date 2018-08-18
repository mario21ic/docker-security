#/bin/bash

docker build -t mario21ic/security:v4 .

docker run -p 80:8080 -v $PWD/html/:/var/www/htdocs/ -ti mario21ic/security:v4

#curl localhost
