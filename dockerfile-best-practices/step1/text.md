
There is a Dockerfile /root/app/Dockerfile.
Modify it, so dependency layer can be reused.
Build the image, name it `server-1`.


<br>
<details><summary>Info</summary>
<br>

```plain
Documentation: https://docs.docker.com/build/guide/layers/#cached-layers.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
In Dockerfile every command is a layer. And if command is doing exactly the same then the layer will be loaded from cache.
However, in our case we copy all of the files (dependecies and modified source code files) in one command.
More effective will be to initially copy dependecy files (as they are changed less often than source code) and install them.
And only afterwards copy source code files. This way we got more layers loaded from the cache on the build of a new image.
It seems like a very small gain in time here, but it can be important when building really big applications.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Modify `/root/app/Dockerfile` (remove `# cached` comments first):

<br>

```plain
# syntax=docker/dockerfile:1
FROM golang:1.21-alpine # cached
WORKDIR /src # cached
COPY go.mod go.sum /src/ # cached
RUN go mod download # cached
COPY . .
RUN go build -o /bin/client ./cmd/client
RUN go build -o /bin/server ./cmd/server
ENTRYPOINT [ "/bin/server" ]
```{{copy}}

<br>

Build the image:

<br>

```plain
docker build -t server-1 .
```{{exec}}


</details>