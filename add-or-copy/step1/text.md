
You can use `ADD` and `COPY` to perform the same action: copy a file.
However, it is recomended to use only `COPY` for that.
Modify existed  `/root/Dockerfile`:
- copy file `copy_file.txt` with keyword `COPY`
- copy file `add_file.txt` with keywork `ADD`
- build image `app-image`, confirm that files were copied to the container

<br>
<details><summary>Info</summary>
<br>

```plain
Documentation: https://docs.docker.com/develop/develop-images/instructions/#add-or-copy
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use docker build -h to see help.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Add next line to the `/root/Dockerfile`:

<br>

```plain
COPY copy_file.txt /app
```{{copy}}

<br>

Add next line to the `/root/Dockerfile`:

<br>

```plain
ADD add_file.txt /app
```{{copy}}

<br>

Build image:

<br>

```plain
docker build -t app-image .
```{{exec}}

<br>

Confirm that files are copied:

<br>

```plain
docker run --rm app-image ls /app
```{{exec}}

</details>