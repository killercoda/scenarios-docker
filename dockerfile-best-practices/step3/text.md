
Build `run-server` and `run-client` images from the same Dockerfile using target keyword.


<br>
<details><summary>Info</summary>
<br>

```plain
Documentation: https://docs.docker.com/build/guide/multi-stage/#parallelism
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
It’s possible to create multiple different images using a single Dockerfile. 
You can specify a target stage of a build using the --target flag. 
Replace the unnamed FROM scratch stage with two separate stages named client and server.       
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Add next line to the `/root/Dockerfile`:

<br>

```plain
# syntax=docker/dockerfile:1
FROM golang:1.21-alpine AS base
WORKDIR /src
COPY go.mod go.sum /src/
RUN go mod download
COPY . .

# build client
FROM base AS build-client
RUN go build -o /bin/client ./cmd/client

# build server
FROM base AS build-server
RUN go build -o /bin/server ./cmd/server

# copy client binary to client image
FROM scratch AS client
COPY --from=build-client /bin/client /bin/
ENTRYPOINT [ "/bin/client" ]

# copy server binary to server image
FROM scratch AS server
COPY --from=build-server /bin/server /bin/
ENTRYPOINT [ "/bin/server" ]
```{{copy}}

<br>

Build the client image:

<br>

```plain
docker build -t run-client --target=client .
```{{exec}}

<br>

Build the server image:

<br>

```plain
docker build -t run-server --target=server .
```{{exec}}

<br>

List available images:

<br>

```plain
docker image ls
```{{exec}}

</details>