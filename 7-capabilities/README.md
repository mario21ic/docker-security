Run a simple container and figure out its capabilities:
```
docker run -d --rm --name demo1 nginx:alpine
docker inspect demo1 --format='{{.State.Pid}}'
CONTAINER_PID=$(docker inspect demo1 --format='{{.State.Pid}}')
grep "Cap" /proc/$CONTAINER_PID/status # all capabilities
# Decoding Cap Effectives
CAPS=$(grep "CapEff" /proc/$CONTAINER_PID/status|awk '{print $2}')
capsh --decode=$CAPS
```

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


Running a Golang app:
```
$ go build main.go
$ ./main.go # listen tcp :81: bind: permission denied

$ sudo capsh --caps='cap_net_bind_service+eip cap_setpcap,cap_setuid,cap_setgid+ep' --keep=1 --user="nobody" --addamb=cap_net_bind_service -- -c "./main"
```

Now trying on a Docker container:
```
$ ./test.sh
CONTAINER_PID=$(docker inspect demo2 --format='{{.State.Pid}}')
grep "Cap" /proc/$CONTAINER_PID/status # all capabilities should be 0000000000000000
```

More info
https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities

Example with Linux Driver please follow the repo
https://github.com/mario21ic/linux-kernel-module-demo
