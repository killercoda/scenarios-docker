
Generate an `index.html` file within `/usr/share/nginx/html` containing `"<h1>Hello from the updated App</h1>"`.

Send get request to `localhost:80`.

Remove `sample-app` container.

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
Use the 'curl' command to send a request to the localhost.

Use echo and > to create file.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Create index.html file:

<br>

```plain
docker exec sample-app sh -c "echo '<h1>Hello from the updated App</h1>' > /usr/share/nginx/html/index.html"
```{{exec}}

<br>

Send get request to `localhost:80`:

<br>

```plain
curl localhost:80
```{{exec}}

<br>

Remove the `sample-app` container:

<br>

```plain
docker rm -f sample-app
```{{exec}}
OR
```plain
docker stop sample-app && docker rm sample-app
```{{exec}}