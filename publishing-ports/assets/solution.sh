#!/bin/bash

cat > /root/Dockerfile <<EOF
FROM nginx
ENV key1=value1
EOF

docker build -t sample-image .

docker image ls

docker run -d --name sample-container sample-image

docker exec sample-container -- env

docker run -d —name sample-container -e key2=value2 key1=new-value1

docker exec app — env