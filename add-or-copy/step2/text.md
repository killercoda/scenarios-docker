
Modify `/root/Dockerfile` up to best practices:
- use `ADD` to fetch remote files
- use `COPY` to copy local files
- build `app-image-2`, confirm that files were transfered to the new container


<br>
<details><summary>Info</summary>
<br>

```plain
Documentation: 
https://docs.docker.com/engine/reference/builder/#add
https://docs.docker.com/engine/reference/builder/#copy
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
COPY:
- used to copy files and directories.
ADD:
- used to fetch files, it's recommended to use ADD instead of RUN wget, because it ensures a more precise build cache
- has built-in support for checksum validation of the remote resources
- has a protocol for parsing branches, tags, and subdirectories from Git URLs
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Modify `/root/Dockerfile` (here we also can specify tag):

<br>

```plain
ADD https://github.com/moby/buildkit.git#v0.10.1 /app
```{{copy}}

<br>

Modify `/root/Dockerfile`:

<br>

```plain
COPY add_file.txt /app
```{{copy}}

<br>

Build the image:

<br>

```plain
docker build -t app-image-2 .
```{{exec}}

<br>

Run the image:

<br>

```plain
docker run --rm app-image-2 ls /app
```{{exec}}


</details>