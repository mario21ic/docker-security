# Docker Security

User namespace remap:
```
$ cat daemon.json
$ sudo cp daemon.json /etc/docker/daemon.json
$ sudo systemctl restart docker.service
$ sudo journalctl -xe
$ sudo journalctl -xeu docker.service

$ sudo id dockremap
$ sudo cat /etc/subuid
$ sudo cat /etc/subgid
```

Test:
```
sudo su -c "echo 'top secret stuff xD' > /root/secrets.txt"
sudo su -c "chmod 0600 /root/secrets.txt"
$ docker run --rm -v /root/secrets.txt:/tmp/secrets.txt alpine cat /tmp/secrets.txt
```

More info https://docs.docker.com/engine/security/userns-remap/
