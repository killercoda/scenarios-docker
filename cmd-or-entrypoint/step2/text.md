
Remove CMD command from Dockerfile and add ENTRYPOINT command that will run the same `echo hi, from container!` command.

Build image `entrypoint-echo` using `/root/Dockerfile`.
Check what is ENTRYPOINT of the newly created `entrypoint-echo` image.

Run the `entrypoint-echo` container:
- Overwrite ENTRYPOINT with `date` via CLI
- Set the CMD to `date` via CLI


<br>
<details><summary>Info</summary>
<br>

```plain
Documentation: https://docs.docker.com/engine/reference/builder/#entrypoint

You can use the ENTRYPOINT to set fairly stable default commands 
and arguments and then use either form of CMD to set 
additional defaults that are more likely to be changed.
```

</details>

<br>
<details><summary>Tip 1</summary>
<br>

```plain
Use docker run --rm cmd-image to remove container after it finished.

Use docker inspect <image-name> to get details about the image's CMD and ENTRYPOINT.
```

</details>

<br>
<details><summary>Tip 2</summary>
<br>

```plain
Once ENTRYPOINT is set, any CMD overwrites, 
without altering the ENTRYPOINT, will be interpreted as additional parameters.
(Compare output of the overwriting CMD here with the previous step)
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Modify `/root/Dockerfile`:

<br>

```plain
cat > /root/Dockerfile <<EOF
FROM alpine
ENTRYPOINT ["echo", "hi, from container!"]
EOF
```{{exec}}

<br>

Build docker image `/root/Dockerfile`:

<br>

```plain
docker build -t entrypoint-echo .
```{{exec}}

<br>

Explore ENTRYPOINT of `entrypoint-echo`:

<br>

```plain
docker inspect entrypoint-echo | jq .[0].ContainerConfig.Entrypoint
```{{exec}}

<br>

Run the container with default values:

<br>

```plain
docker run --rm entrypoint-echo
```{{exec}}

<br>

Run the container with date:

<br>

```plain
docker run --rm --entrypoint date entrypoint-echo
```{{exec}}

<br>

Run the container with entrypoint `date`:

<br>

```plain
docker run --rm entrypoint-echo date
```{{exec}}


</details>