Prerequisites:
```
$ sudo apt install uidmap
```

Instalar y validar:
```
dockerd-rootless-setuptool.sh install

systemctl --user status docker.service

systemctl --user enable docker
sudo loginctl enable-linger $(whoami)

cat $HOME/.config/systemd/user/docker.service
```

Configurar cliente:
```
export PATH=/usr/bin:$PATH:$HOME/bin
export DOCKER_HOST=unix:///run/user/1000/docker.sock

docker ps
docker run -d -p 8080:80 nginx:alpine
```

Based on https://docs.docker.com/engine/security/rootless/
