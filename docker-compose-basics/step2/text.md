
First, stop the previous services:

```plain
cd /root/compose-project && docker-compose down
```{{exec}}

Now create a multi-service application in `/root/full-stack` directory.

Create a `docker-compose.yml` file that defines two services:

**Service 1 - `frontend`:**
* image: `nginx:alpine`
* ports: `8080:80`
* volumes: mount `/root/full-stack` to `/usr/share/nginx/html`

**Service 2 - `database`:**
* image: `postgres:14-alpine`
* environment variables:
  * `POSTGRES_USER`: admin
  * `POSTGRES_PASSWORD`: secret
  * `POSTGRES_DB`: myapp

After creating the file, start all services with `docker-compose up -d`.

<br>
<details><summary>Info</summary>
<br>

```plain
Docker Compose makes it easy to run multiple related containers together.

Each service runs in its own container, but they can communicate with each other using service names as hostnames.

Environment variables can be set directly in the docker-compose.yml file.

Documentation - https://docs.docker.com/compose/compose-file/
```

</details>

<br>
<details><summary>Tip 1</summary>
<br>

```plain
Multiple services are defined under the 'services' key:

services:
  service1:
    ...
  service2:
    ...
```

</details>

<br>
<details><summary>Tip 2</summary>
<br>

```plain
Environment variables can be set using the 'environment' key:

environment:
  - KEY1=value1
  - KEY2=value2

or as a mapping:

environment:
  KEY1: value1
  KEY2: value2
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Create the docker-compose.yml file:

<br>

```plain
cat > /root/full-stack/docker-compose.yml <<EOF
version: '3.8'
services:
  frontend:
    image: nginx:alpine
    ports:
      - "8080:80"
    volumes:
      - /root/full-stack:/usr/share/nginx/html
      
  database:
    image: postgres:14-alpine
    environment:
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: secret
      POSTGRES_DB: myapp
EOF
```{{exec}}

<br>

Start all services:

<br>

```plain
cd /root/full-stack && docker-compose up -d
```{{exec}}

<br>

View all running services:

<br>

```plain
docker-compose ps
```{{exec}}

<br>

Check logs for a specific service:

<br>

```plain
docker-compose logs database
```{{exec}}

</details>
