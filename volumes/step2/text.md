Rewrite `/usr/share/nginx/html/index.html` file with `"<h1>Hello from the updated App</h1>"`.

Send get request to `localhost:80`.

Remove `sample-app` container.

<br>
<details><summary>Info</summary>
<br>

```plain
Check the instructions on handling volumes by using "docker volume --help".

Documentation - https://docs.docker.com/storage/volumes/#populate-a-volume-using-a-container.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use > to rewrite contents of the file.

Use the 'curl' command to send a request to the localhost.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Rewrite index.html file:

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
Or
```plain
docker stop sample-app && docker rm sample-app
```{{exec}}