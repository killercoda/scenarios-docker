
Initiate container named `app-2`: 
* mount `/root/app-2` directory on the host to the `/usr/share/nginx/html` directory within the container
* utilize the `nginx:alpine` image
* map `127.0.0.1:81` on the host with port `80` within the container



Send get request to `localhost:81`.


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

Initiate `app-2` container:

<br>

```plain
docker run -d -v /root/app-2:/usr/share/nginx/html -p 127.0.0.1:81:80 --name app-2 nginx:alpine
```{{exec}}

<br>

Send get request to `localhost:81`:

<br>

```plain
curl localhost:81
```{{exec}}

</details>