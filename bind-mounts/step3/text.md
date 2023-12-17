
Initiate a container named `sample-app`:
* utilize the `nginx:alpine` image
* attach it to the `/root/app-data` directory on the host
* mount this bind to the `/usr/share/nginx/html` directory within the container
* ensure port `80` on the host is mapped to port `80` within the container

Send get request to `localhost:80`.


<br>
<details><summary>Info</summary>
<br>

```plain
Documentation - https://docs.docker.com/storage/bind-mounts/.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use --mount or -v flag to mount volume.

Use -d flag to run container in the detached mode.

Use the 'curl' command to send a request to the localhost.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run the container with the mounted directory:

<br>

```plain
docker run -d -p 80:80 --mount type=bind,src=/root/app-data,target=/usr/share/nginx/html --name sample-app nginx:alpine
```{{exec}}
OR
```plain
docker run -d -p 80:80 -v /root/app-data:/usr/share/nginx/html --name sample-app nginx:alpine
```{{exec}}

<br>

Send get request to `localhost:80`:

<br>

```plain
curl localhost:80
```{{exec}}
