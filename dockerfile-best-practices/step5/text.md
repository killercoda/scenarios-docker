
Export binaries to the `/root/app/bin` as `server` and `client` using Dockerfile.

<br>
<details><summary>Info</summary>
<br>

```plain
Docs: https://docs.docker.com/build/guide/export/#export-binaries

The default format of output for build command is docker image.
But, it can be changed to binary by using local exporter (use --output flag).
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use docker build -h
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Add next line to the `/root/app/Dockerfile`:

<br>

```plain
# syntax=docker/dockerfile:1
ARG GO_VERSION=1.21
FROM golang:${GO_VERSION}-alpine AS base
WORKDIR /src
COPY go.mod go.sum /src/
RUN go mod download
COPY . .

FROM base AS build-client
RUN go build -o /bin/client ./cmd/client

FROM base AS build-server
RUN go build -o /bin/server ./cmd/server

FROM scratch AS client
COPY --from=build-client /bin/client /bin/
ENTRYPOINT [ "/bin/client" ]

FROM scratch AS server
COPY --from=build-server /bin/server /bin/
ENTRYPOINT [ "/bin/server" ]

# exporting binaries from server and client images
FROM scratch AS binaries
COPY --from=server /bin/server /
COPY --from=client /bin/client /
```{{copy}}

<br>

Export binaries:

<br>

```plain
docker build --output=/root/app --target=binaries .
```{{exec}}

</details>