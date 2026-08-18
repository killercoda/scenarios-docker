
Create a new compose file in `/root/scaling-demo` to demonstrate service scaling.

Create a `docker-compose.yml` file with a service named `worker` that:
* uses the `nginx:alpine` image
* has no specific ports defined

After creating the file, start the service and then scale it to run 3 instances:

```plain
cd /root/scaling-demo && docker-compose up -d
docker-compose up -d --scale worker=3
```{{exec}}

View all running instances with `docker-compose ps`.

<br>
<details><summary>Info</summary>
<br>

```plain
Docker Compose can scale services to run multiple instances.

Scaling is useful for load balancing and high availability.

When scaling, Docker creates multiple containers with numbered suffixes (worker_1, worker_2, etc.).

You cannot scale services that have specific port mappings (would cause conflicts).

Documentation - https://docs.docker.com/compose/reference/up/
```

</details>

<br>
<details><summary>Tip 1</summary>
<br>

```plain
The --scale flag syntax:

docker-compose up -d --scale service-name=number
```

</details>

<br>
<details><summary>Tip 2</summary>
<br>

```plain
To scale multiple services:

docker-compose up -d --scale service1=3 --scale service2=2
```

</details>

<br>
<details><summary>Tip 3</summary>
<br>

```plain
You can remove specific port mappings and use a load balancer or let orchestration tools handle routing.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Create the directory and docker-compose.yml:

<br>

```plain
mkdir -p /root/scaling-demo && cat > /root/scaling-demo/docker-compose.yml <<EOF
version: '3.8'
services:
  worker:
    image: nginx:alpine
EOF
```{{exec}}

<br>

Start the service:

<br>

```plain
cd /root/scaling-demo && docker-compose up -d
```{{exec}}

<br>

Scale to 3 instances:

<br>

```plain
docker-compose up -d --scale worker=3
```{{exec}}

<br>

View all instances:

<br>

```plain
docker-compose ps
```{{exec}}

<br>

You can also use docker ps to see all containers:

<br>

```plain
docker ps | grep worker
```{{exec}}

<br>

Scale down to 2 instances:

<br>

```plain
docker-compose up -d --scale worker=2
```{{exec}}

<br>

Stop all services:

<br>

```plain
docker-compose down
```{{exec}}

</details>
