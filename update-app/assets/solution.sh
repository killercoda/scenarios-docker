#!/bin/bash

docker build -t app/v1 .

docker run -d -p 5000:5000 —name app app/v1

curl localhost:5000

echo "<h2>Some updates for app/v2</h2>" >> /root/index.html

docker build -t app/v2

docker rm -f app

docker run -d -p 5000:5000 —name app app/v2

curl localhost:5000