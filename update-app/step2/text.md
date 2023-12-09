
Append line `<h2>Some updates for app/v2</h2>` to `/root/index.html` file.

Build docker image `app/v2` from `/root/Dockerfile`.

Remove container `app`.

Start the container named `app`, it should:
* use `app/v2` image
* map port 3000 on the host with port 3000 in the container
* run in the background (use -d flag)


Make a request to localhost:3000.


<br>
<details><summary>Info</summary>
<br>

```plain
To run container with exposed port use -p flag.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use >> to append text to the file.

Use docker build and docker run commands.

Use --help flag to see the help.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Append line `<h2>Some updates for app/v2</h2>` to `/root/index.html` file:

<br>

```plain
echo "<h2>Some updates for app/v2</h2>" >> /root/index.html
```{{exec}}


<br>

Build app/v2 image:

<br>

```plain
docker build -t app/v2 .
```{{exec}}

<br>

Delete container app created from the image app/v1:

<br>

```plain
docker rm -f app
```{{exec}}
OR
```plain
docker stop app && docker rm app
```{{exec}}


<br>

Run the container with exposed port 3000.

<br>

```plain
docker run -d -p 3000:3000 --name app app/v2 
```{{exec}}

<br>

Make a request to localhost:3000:

<br>

```plain
curl localhost:3000
```{{exec}}

<br>
