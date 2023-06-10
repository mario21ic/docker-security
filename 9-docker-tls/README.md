$ openssl genrsa -aes256 -out ca-key.pem 4096
Enter PEM pass phrase: # at least 4 characters

$ openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem
Enter pass phrase for ca-key.pem:
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:PE
State or Province Name (full name) [Some-State]:Lima
Locality Name (eg, city) []:Lima
Organization Name (eg, company) [Internet Widgits Pty Ltd]:MyCompany
Organizational Unit Name (eg, section) []:None
Common Name (e.g. server FQDN or YOUR name) []:servidor
Email Address []:myemail@gmail.com

$ openssl genrsa -out server-key.pem 4096

$ openssl req -subj "/CN=servidor" -sha256 -new -key server-key.pem -out server.csr
req: No value provided for subject name attribute "CN", skipped

$ openssl req -subj "/CN=servidor" -sha256 -new -key server-key.pem -out server.csr 

$ echo subjectAltName = DNS:servidor,IP:192.168.1.2,IP:127.0.0.1 >> extfile.cnf
$ echo extendedKeyUsage = serverAuth >> extfile.cnf
$ openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile extfile.cnf


Client:
$ openssl genrsa -out key.pem 4096
$ openssl req -subj '/CN=client' -new -key key.pem -out client.csr
$ echo extendedKeyUsage = clientAuth > extfile-client.cnf
$ openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out cert.pem -extfile extfile-client.cnf

# Optional
$ rm -v client.csr server.csr extfile.cnf extfile-client.cnf

# Set permissions
$ chmod -v 0400 ca-key.pem key.pem server-key.pem
$ chmod -v 0444 ca.pem server-cert.pem cert.pem

# Server
$ dockerd \
    --tlsverify \
    --tlscacert=ca.pem \
    --tlscert=server-cert.pem \
    --tlskey=server-key.pem \
    -H=0.0.0.0:2376
$ sudo vim /lib/systemd/system/docker.service
ExecStart=/usr/bin/dockerd --containerd=/run/containerd/containerd.sock --tlsverify --tlscacert=/etc/docker/ca.pem --tlscert=/etc/docker/server-cert.pem --tlskey=/etc/docker/server-key.pem -H=127.0.0.1:2376

# Testing
$ docker --tlsverify \
    --tlscacert=ca.pem \
    --tlscert=cert.pem \
    --tlskey=key.pem \
    -H=127.0.0.1:2376 version

$ mkdir -pv ~/.docker
$ cp -v {ca,cert,key}.pem ~/.docker
$ export DOCKER_HOST=tcp://127.0.0.1:2376 DOCKER_TLS_VERIFY=1

Based on https://docs.docker.com/engine/security/protect-access/#use-tls-https-to-protect-the-docker-daemon-socket
