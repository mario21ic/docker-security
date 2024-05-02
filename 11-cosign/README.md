Init & Sign
```
cosign initialize
cosign generate-key-pair

docker login harbor-ip-server
cosign sign --key cosign.key harbor-ip-server/mario21ic/nginx:fake-v1.6
```

Pull:
```
export DOCKER_CONTENT_TRUST=1
export DOCKER_CONTENT_TRUST_SERVER=https://harbor-ip-server

docker pull harbor-ip-server/mario21ic/nginx:fake-v1.6
```

Verify
```
cosign verify --key cosign.pub harbor-ip-server/mario21ic/nginx:fake-v1.6
```
