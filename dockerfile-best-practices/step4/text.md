
Add build argument `GO_VERSION` to the Dockerfile.
And build image with provided golang version 1.22.

<br>
<details><summary>Info</summary>
<br>

```plain
Documentation: https://docs.docker.com/build/guide/build-args/
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Build arguments is a great way to add flexibility to your builds. 
You can pass build arguments at build-time, and you can set a default value that the builder uses as a fallback.

You can also inject values inside your code, but the way it's done is different for every language.
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

# defining variable
ARG GO_VERSION=1.21

# using variable
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
```{{copy}}

<br>

Build the image:

<br>

```plain
docker build --build-arg="GO_VERSION=1.22" .
```{{exec}}


</details>