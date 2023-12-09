#!/bin/bash

cat > /root/Dockerfile <<EOF
FROM nginx:alpine
ENV key1=value1
EOF

docker build -t sample-image .

docker image ls

docker run -d --name sample-app sample-image

docker exec sample-app env

docker run -d —name sample-app-2 -e key2=value2 -e key1=new-value1 sample-image

docker exec sample-app-2 env