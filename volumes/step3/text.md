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
If the volume is empty, volume going to be populated by data from container.
Otherwise, the data in the container is going to be replaced by volume's data.

Check the instructions on handling volumes by using `docker volume --help`.

Documentation - https://docs.docker.com/storage/volumes/#populate-a-volume-using-a-container.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use flag -v or --mount when running the container - https://docs.docker.com/storage/volumes/#choose-the--v-or---mount-flag.

Be cautious about where you attach the volume on the container's filesystem. 
If the volume isn't empty, all the existing data will be overwritten by the data in the volume.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run the container with a mounted volume:
(specifying `type=volume`isn't required, as it's the default behavior)

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
