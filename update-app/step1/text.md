
Build docker image named `app/v1` using `/root/Dockerfile`.

Start the container named `app`, it should:
* use `app/v1` image
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
Use docker build and docker run commands. 

Use --help flag to see the help.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Build app/v1 image:

<br>

```plain
docker build -t app/v1 .
```{{exec}}

<br>

Launch the container exposing port 3000:

<br>

```plain
docker run -d -p 3000:3000 --name app app/v1 
```{{exec}}

<br>

Make a request to localhost:3000:

<br>

```plain
curl localhost:3000
```{{exec}}

<br>
