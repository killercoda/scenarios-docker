
Create a new file `/root/Dockerfile` to build a container image from. It should:
* use `bash` as base
* run `ping killercoda.com`

Build the image and tag it as `pinger`.

Run the image (create a container) named `my-ping`.


<br>
<details><summary>Info</summary>
<br>

```plain
Dockerfile: List of commands from which an Image can be build

Image: Binary file which includes all data/requirements to be run as a Container

Container: Running instance of an Image

Registry: Place where we can push/pull Images to/from
```

</details>



<br>
<details><summary>Solution</summary>
<br>

<br>

Create the `/root/Dockerfile`:

<br>

```plain
FROM bash
CMD ["ping", "killercoda.com"]
```

<br>

Build the image:

<br>

```plain
docker build -t pinger .

docker image ls
```{{exec}}

<br>

Run the image:

<br>

```plain
docker run --name my-ping pinger
```{{exec}}

</details>
