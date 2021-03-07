Run a container with privileged mode and all capabilities:
```
docker run -ti --privileged --cap-add=ALL ubuntu:18.04 bash
cat /proc/1/status |grep Cap
```

Run a container without mknod:
```
docker run -ti --cap-add=ALL --cap-drop=MKNOD ubuntu:18.04 bash
cat /proc/1/status |grep Cap
```

Run a container with net admin:
```
docker run -it --rm --cap-add=NET_ADMIN ubuntu:14.04 ip link add dummy0 type dummy
```

More info
https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities

Example with Linux Driver please follow the repo
https://github.com/mario21ic/linux-kernel-module-demo
