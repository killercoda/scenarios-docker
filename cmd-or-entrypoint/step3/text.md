
Use CMD and ENTRYPOINT to run the same `echo "hi, from container!"` command.
Build image from `/root/Dockerfile` and name it `image-echo`.
Check what is CMD and ENTRYPOINT of the newly created `image-echo` image.


Run the `image-echo` container:
- with default cmd and entrypoint values
- with another message `hi, from the updated image` via CLI
- Set the CMD to `date` via CLI
- Set ENTRYPOINT to `date` via CLI


<br>
<details><summary>Info</summary>
<br>

```plain
Docs:
- https://docs.docker.com/develop/develop-images/instructions/#cmd
- https://docs.docker.com/develop/develop-images/instructions/#entrypoint

In essence, the entrypoint is a binary, and cmd contains parameters in Docker. When running a container, you have the flexibility to override both entrypoint and cmd parameters.

However, overwriting the command is simpler when the entrypoint is either not defined or set as a shell. Therefore, for a more specific image, consider specifying the ENTRYPOINT along with default parameters through CMD. These parameters can then be easily modified via CLI when executing 'docker run.'

Alternatively, if you prefer, you can leave the ENTRYPOINT as is (often just a shell) and provide the complete command in the CMD. This allows you to use the image seamlessly to construct containers with any desired command.
```

</details>

<br>
<details><summary>Tip 1</summary>
<br>

```plain
Use docker run -h
```

</details>

<br>
<details><summary>Tip 2</summary>
<br>

```plain
Take another close look at the last two commands here, 
as they illustrate the distinction between CMD and ENTRYPOINT.
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
ENTRYPOINT ["echo"]
CMD ["hi, from container!"]
EOF
```{{exec}}

<br>

Build docker image `/root/Dockerfile`:

<br>

```plain
docker build -t image-echo .
```{{exec}}

<br>

Explore CMD and ENTRYPOINT of `image-echo`:

<br>

```plain
docker inspect image-echo | jq .[0].ContainerConfig.Cmd &&
docker inspect image-echo | jq .[0].ContainerConfig.Entrypoint
```{{exec}}

<br>

Run the container with default values:

<br>

```plain
docker run --rm image-echo
```{{exec}}

<br>

Run the container with updated message:

<br>

```plain
docker run --rm image-echo hi, from the updated image
```{{exec}}

<br>

Run the container with CMD `date`:

<br>

```plain
docker run --rm image-echo date
```{{exec}}

<br>

Run the container with ENTRYPOINT `date`:

<br>

```plain
docker run --rm --entrypoint date image-echo
```{{exec}}


</details>