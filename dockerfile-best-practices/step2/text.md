
Separate build stage and create image only with the resulted binary.
Compare the size of the images `server-1` and `server-2`.
Use `scratch` as a base image for the runnable image.

<br>
<details><summary>Info</summary>
<br>

```plain
Documentation: https://docs.docker.com/build/guide/multi-stage/.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
With multi-stage builds:
- you can run builds in parallel
- you can separate build files from binaries
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Modify `/root/app/Dockerfile` (remove all comments first):

<br>

```plain
# syntax=docker/dockerfile:1
FROM golang:1.21-alpine
WORKDIR /src
COPY go.mod go.sum /src/
RUN go mod download
COPY . .
RUN go build -o /bin/client ./cmd/client
RUN go build -o /bin/server ./cmd/server
# as it is just a build step, we don't need CMD or ENTRYPOINT command

FROM scratch # minimal base image
COPY --from=0 /bin/server /bin/ # copy /bin/server file from the previously build image (0 as we didn't name it)
ENTRYPOINT [ "/bin/server" ]
```{{copy}}

<br>

Build the image:

<br>

```plain
docker build -t server-2 .
```{{exec}}


</details>