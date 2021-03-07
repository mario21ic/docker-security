Docker hub login:
```
docker login
```

Generate key:
```
docker trust key generate mario
```

Adding signer to the repository:
```
docker trust signer add --key /repo/docker-security/mario.pub mario21ic mario21ic/alpine
```

Pull the image:
```
docker pull mario21ic/alpine
```

Tag the image
```
docker tag mario21ic/alpine mario21ic/alpine:signed
```

Sign the image:
```
docker trust sign mario21ic/alpine:signed
```

Inspect the image:
```
docker trust inspect --pretty mario21ic/alpine:signed
```

Push the signed image:
```
docker push mario21ic/alpine:signed
```

Enable Content trust at the Docker host
```
export DOCKER_CONTENT_TRUST=1
docker pull mario21ic/alpine:3.4
```

