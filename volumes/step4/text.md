
Verify the directory location on the host where `sample-volume` is linked.
Add the line `"Added from the host"` to the `index.html` file on the host.

Send get request to `localhost:80`.

<br>
<details><summary>Info</summary>
<br>

```plain
Warning! Don't do this in production.

Volumes are not designed to be edited on the host. 
Use bind mounts for this instead.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use "docker volume inspect" command to see detailed information about the volume.

Use >> to append line to the file.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Inspect `sample-volume`:

<br>

```plain
docker volume inspect sample-volume
```{{exec}}

<br>

Append line to the index.html on the host:

<br>

```plain
echo "Added from the host" >> /var/lib/docker/volumes/sample-volume/_data/index.html
```{{exec}}

<br>

Make a request to `localhost:80`:

<br>

```plain
curl localhost:80
```{{exec}}

</details>