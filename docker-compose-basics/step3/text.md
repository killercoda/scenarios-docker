
Update the existing `docker-compose.yml` file in `/root/full-stack` to add service dependencies and test networking between containers.

Modify the `frontend` service to add:
* `depends_on` clause specifying that it depends on `database`
* a container name: `app-frontend`

Modify the `database` service to add:
* a container name: `app-database`

After updating, restart the services with:
1. `docker-compose down`
2. `docker-compose up -d`

Then test the network connectivity by executing a command from the frontend container to connect to the database:

```plain
docker exec app-frontend ping -c 2 app-database
```{{exec}}

<br>
<details><summary>Info</summary>
<br>

```plain
Docker Compose automatically creates a network for your application.

By default, services can reach each other using their service names as hostnames.

The 'depends_on' option ensures services start in the correct order.

Container names can be explicitly set for easier reference.

Documentation - https://docs.docker.com/compose/networking/
```

</details>

<br>
<details><summary>Tip 1</summary>
<br>

```plain
The depends_on syntax:

service-name:
  depends_on:
    - other-service
    - another-service
```

</details>

<br>
<details><summary>Tip 2</summary>
<br>

```plain
To set a container name:

service-name:
  container_name: my-container
```

</details>

<br>
<details><summary>Tip 3</summary>
<br>

```plain
Services in the same Docker Compose project can communicate using:
- Service name (e.g., 'database')
- Container name (e.g., 'app-database')

Both resolve to the container's IP address.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Update the docker-compose.yml file:

<br>

```plain
cat > /root/full-stack/docker-compose.yml <<EOF
version: '3.8'
services:
  frontend:
    image: nginx:alpine
    container_name: app-frontend
    ports:
      - "8080:80"
    volumes:
      - /root/full-stack:/usr/share/nginx/html
    depends_on:
      - database
      
  database:
    image: postgres:14-alpine
    container_name: app-database
    environment:
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: secret
      POSTGRES_DB: myapp
EOF
```{{exec}}

<br>

Restart services:

<br>

```plain
cd /root/full-stack && docker-compose down && docker-compose up -d
```{{exec}}

<br>

Test network connectivity:

<br>

```plain
docker exec app-frontend ping -c 2 app-database
```{{exec}}

<br>

You can also test using the service name:

<br>

```plain
docker exec app-frontend ping -c 2 database
```{{exec}}

<br>

View the network created by Docker Compose:

<br>

```plain
docker network ls | grep full-stack
```{{exec}}

</details>
