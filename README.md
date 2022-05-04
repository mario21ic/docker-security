# Docker Security

Creating file /root/secrets.txt
```
./create_file.sh
```

User namespace:
```
$ sudo vim /etc/docker/daemon.json
{
  "userns-remap": "default"
}
$ sudo systemctl restart docker.service
$ sudo id dockremap
$ sudo cat /etc/subuid
$ sudo cat /etc/subgid

$ docker run --rm -v /root/secrets.txt:/tmp/secrets.txt alpine cat /tmp/secrets.txt
```
More info https://docs.docker.com/engine/security/userns-remap/

Docker Rootless:
It's another good option, but it has some limitations https://docs.docker.com/engine/security/rootless/

TODO:
- AppArmor
- Seccomp
- SELinux
- Open Policy Agent
