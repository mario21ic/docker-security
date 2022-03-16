#!/bin/bash

docker build -t mario21ic/security:v7 ./

docker run --rm --name demo2 -p 81:80 --cap-drop=ALL mario21ic/security:v7
