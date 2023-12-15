

Initiate container named `app-1`: 
* mount `/root/app-1` directory on the host to the `/usr/share/nginx/html` directory within the container
* utilize the `nginx:alpine` image
* ensure port `80` on the host is mapped to port `80` within the container

Send get request to `localhost:80`.


<br>
<details><summary>Info</summary>
<br>

```plain
Documentation - https://docs.docker.com/network/#published-ports.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use -d (detached) flag when running the container.

Use -p or --publish flag to map ports.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Initiate `app-1` container:

<br>

```plain
docker run -d -v /root/app-1:/usr/share/nginx/html -p 80:80 --name app-1 nginx:alpine
```{{exec}}

<br>

Send get request to `localhost:80`:

<br>

```plain
curl localhost:80
```{{exec}}

</details>