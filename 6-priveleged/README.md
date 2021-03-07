Run a container with privileged mode:
```
docker run -ti --privileged --name myprivileged ubuntu:18.04 bash
ls -la /dev/

mkdir /mnt/tmp
mkdir mount -t tmpfs none /mnt/tmp/
df -h
```

Verify:
```
docker inspect --format='{{.HostConfig.Privileged}}' myprivileged
```

Accesing device without privileged mode:
```
docker run -ti --device=/dev/sda:/dev/sda ubuntu:18.04 bash
ls -la /dev/
```

Run a container with privileged mode and all capabilities:
```
docker run -ti --privileged --cap-add=ALL ubuntu:18.04 bash
cat /proc/1/status |grep Cap
```

Example with Linux Driver please follow the repo
https://github.com/mario21ic/linux-kernel-module-demo
