
Create docker volume named `sample-volume`.

Initiate a container named `sample-app`:
* utilize the `nginx:alpine` image
* attach it to the volume `sample-volume`
* mount this volume to the `/usr/share/nginx/html` directory within the container
* ensure port `80` on the host is mapped to port `80` within the container

Send get request to `localhost:80`.

<br>
<details><summary>Info</summary>
<br>

```plain
If the volume is empty, volume is populated by data from container. 
Otherwise, the data in the container is going to be replaced by the volume's data.

Check the instructions on handling volumes by using "docker volume --help".

Documentation - https://docs.docker.com/storage/volumes/#populate-a-volume-using-a-container.
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

Create volume:

<br>

```plain
docker volume create sample-volume
```{{exec}}


<br>

Run the container with the mounted directory:

<br>

```plain
docker run -d -p 80:80 --mount type=volume,src=sample-volume,target=/usr/share/nginx/html --name sample-app nginx:alpine
```{{exec}}
OR
```plain
docker run -d -p 80:80 -v sample-volume:/usr/share/nginx/html --name sample-app nginx:alpine
```{{exec}}

<br>

Send get request to `localhost:80`:

<br>

```plain
curl localhost:80
```{{exec}}