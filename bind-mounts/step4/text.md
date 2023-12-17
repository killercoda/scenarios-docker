
Add line `"Added from the host"` to the `/root/app-data/index.html` file on the host.

Send get request to `localhost:80`.

<br>
<details><summary>Info</summary>
<br>

```plain
Documentation - https://docs.docker.com/storage/bind-mounts/
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use the 'curl' command to send a request to the localhost.

Use >> to add line to the file.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Add line to the `/root/app-data/index.html` file on the host:

<br>

```plain
echo "Added from the host" >> /root/app-data/index.html
```{{exec}}

<br>

Send get request to `localhost:80`:

<br>

```plain
curl localhost:80
```{{exec}}

</details>