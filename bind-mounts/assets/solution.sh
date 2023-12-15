#!/bin/bash

docker run -d -p 80:80 --mount type=bind,src=/root/app-data,target=/usr/share/nginx/html --name sample-app nginx:alpine

curl localhost:80

docker exec sample-app sh -c "ls /usr/share/nginx/html"

docker exec sample-app sh -c "echo '<h1>Hello from the updated App</h1>' > /usr/share/nginx/html/index.html"

curl localhost:80

docker rm -f sample-app

docker run -d -p 80:80 --mount type=bind,src=/root/app-data,target=/usr/share/nginx/html --name sample-app nginx:alpine

curl localhost:80

echo "Added from the host" >> /root/app-data/index.html

curl localhost:80
