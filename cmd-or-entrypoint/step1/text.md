
Build image `cmd-echo` using `/root/Dockerfile`.
Check what is CMD of the newly created `cmd-echo` image.

Run the `cmd-echo` container:
- Don't modify Dockerfile
- Overwrite CMD with `date` via CLI
- Set the ENTRYPOINT to `date` via CLI

<br>
<details><summary>Info</summary>
<br>

```plain
Documentation: https://docs.docker.com/engine/reference/builder/#cmd

There can only be one CMD instruction in a Dockerfile.
If you list more than one CMD, only the last one takes effect.

The purpose of a CMD is to provide defaults for an executing container.
However, it can be used as a way to provide an executable and defaults.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use docker run --rm cmd-image to remove container after it finished.

Use docker inspect <image-name> to get details about the image's CMD and ENTRYPOINT.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Build docker image `/root/Dockerfile`:

<br>

```plain
docker build -t cmd-echo .
```{{exec}}

<br>

Explore CMD of `cmd-echo`:

<br>

```plain
docker inspect cmd-echo | jq .[0].ContainerConfig.Cmd
```{{exec}}

<br>

Run the container with default values:

<br>

```plain
docker run --rm cmd-echo
```{{exec}}

<br>

Run the container with updated CMD command:

<br>

```plain
docker run --rm cmd-echo date
```{{exec}}

<br>

Run the container with ENTRYPOINT `date`:

<br>

```plain
docker run --rm --entrypoint date cmd-echo
```{{exec}}


</details>