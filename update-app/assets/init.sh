#!/bin/bash

cat <<EOT > /root/.vimrc
set expandtab
set tabstop=2
set shiftwidth=2
EOT

# init scenario
rm $0
mkdir -p /opt/ks

# scenario specific

cat >> /root/Dockerfile <<EOF
FROM python:3.10-alpine

WORKDIR /app

COPY requirements.txt /app
RUN pip3 install -r requirements.txt

COPY . /app
EXPOSE 3000

ENTRYPOINT ["python3"]
CMD ["app.py"]
EOF

cat >> /root/index.html <<EOF
<h1>Hello, from the app/v1</h1>
EOF

cat >> /root/requirements.txt <<EOF
flask
EOF

cat >> /root/app.py <<EOF
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    f = open("index.html", "r")
    index = f.read()
    f.close()
    return index

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000)
EOF

podman run -d \
  --restart=always \
  --name registry \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:5000 \
  -p 5000:5000 \
  docker.io/library/registry:2

echo '172.30.1.2 local-registry' >> /etc/hosts

cat >> /etc/containers/registries.conf <<EOF
[[registry]]
location="local-registry:5000"
insecure=true
EOF

cp /etc/docker/daemon.json /etc/docker/daemon.json.tmp
cat /etc/docker/daemon.json.tmp | grep -v registry-mirrors | grep -v \} > /etc/docker/daemon.json
cp /etc/docker/daemon.json /etc/docker/daemon.json.tmp
echo "$(cat /etc/docker/daemon.json.tmp)," > /etc/docker/daemon.json

cat >> /etc/docker/daemon.json <<EOF
  "registry-mirrors": ["http://local-registry:5000", "https://mirror.gcr.io", "https://docker-mirror.killer.sh"],
  "insecure-registries": ["local-registry:5000"]
}
EOF
systemctl daemon-reload
systemctl enable docker
systemctl restart docker


# mark init finished
touch /ks/.initfinished