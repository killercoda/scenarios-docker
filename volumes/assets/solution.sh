#!/bin/bash

docker volume create sample-volume

docker run -d -p 80:80 --mount type=volume,src=sample-volume,target=/usr/share/nginx/html --name sample-app nginx:alpine

curl localhost:80

docker exec sample-app sh -c "echo '<h1>Hello from the updated App</h1>' > /usr/share/nginx/html/index.html"

curl localhost:80

docker rm -f sample-app

docker run -d -p 80:80 --mount type=volume,src=sample-volume,target=/usr/share/nginx/html --name sample-app nginx:alpine

curl localhost:80

docker volume inspect sample-volume

echo "Added from the host" >> /var/lib/docker/volumes/sample-volume/_data/index.html

curl localhost:80