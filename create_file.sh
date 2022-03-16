#/bin/bash

sudo su -c "echo 'top secret stuff xD' > /root/secrets.txt"
sudo su -c "chmod 0600 /root/secrets.txt"

sudo file /root/secrets.txt
