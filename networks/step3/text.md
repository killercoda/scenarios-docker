
Remove `app-1` container.

Initiate new container named `app-1`: 
* mount `/root/app-1` directory on the host to the `/usr/share/nginx/html` directory within the container
* attach container to the predefined `host` network
* utilize the `nginx:alpine` image

Make a request to `localhost:80`.


<br>
<details><summary>Info</summary>
<br>

```plain
Documentation - https://docs.docker.com/network/drivers/host/.
```

</details>

<br>
<details><summary>Tip 1</summary>
<br>

```plain
Use --network flag to attach container to the host network.

Attaching a running container to the host network isn't feasible, 
so make sure to configure it when launching the container.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Remove container `app-1`:

<br>

```plain
docker rm -f app-1
```{{exec}}
OR
```plain
docker stop app-1 \
&& \
docker rm app-1
```{{exec}}

<br>

Initiate `app-1` container:

<br>

```plain
docker run -d -v /root/app-1:/usr/share/nginx/html --name app-1 --network host nginx:alpine
```{{exec}}

<br>

Send get request to `localhost:80`:

<br>

```plain
curl localhost:80
```{{exec}}


</details>