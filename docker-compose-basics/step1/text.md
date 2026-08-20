
Create your first `docker-compose.yml` file in the `/root/compose-project` directory.

The compose file should define a service named `web` that:
* uses the `nginx:alpine` image
* maps port `8080` on the host to port `80` in the container
* mounts `/root/web-app` directory to `/usr/share/nginx/html` in the container

After creating the file, start the services using `docker-compose up -d`.

<br>
<details><summary>Info</summary>
<br>

```plain
Docker Compose is a tool for defining and running multi-container Docker applications.

With Compose, you use a YAML file to configure your application's services, networks, and volumes.

The docker-compose.yml file uses a declarative format to define your application stack.

Documentation - https://docs.docker.com/compose/
```

</details>

<br>
<details><summary>Tip 1</summary>
<br>

```plain
The basic structure of a docker-compose.yml file:

version: '3.8'
services:
  service-name:
    image: image-name
    ports:
      - "host:container"
    volumes:
      - "host-path:container-path"
```

</details>

<br>
<details><summary>Tip 2</summary>
<br>

```plain
Remember to run docker-compose commands from the directory containing docker-compose.yml.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Create the docker-compose.yml file:

<br>

```plain
cat > /root/compose-project/docker-compose.yml <<EOF
version: '3.8'
services:
  web:
    image: nginx:alpine
    ports:
      - "8080:80"
    volumes:
      - /root/web-app:/usr/share/nginx/html
EOF
```{{exec}}

<br>

Navigate to the directory and start services:

<br>

```plain
cd /root/compose-project && docker-compose up -d
```{{exec}}

<br>

Verify the service is running:

<br>

```plain
docker-compose ps
```{{exec}}

<br>

Test the web server:

<br>

```plain
curl http://localhost:8080
```{{exec}}

</details>
