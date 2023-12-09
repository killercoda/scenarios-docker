

Launch a container named `sample-app-2` using the existing image `sample-image`, introducing the environment variables `key2=value2` and `key1=new-value1`. 
Ensure the Dockerfile remains unchanged.

List the environment variables within the instantiated `sample-app-2` container.


<br>
<details><summary>Info</summary>
<br>

```plain
Environment variables in Docker:
https://docs.docker.com/develop/develop-images/instructions/#env.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use -e flag when running the container.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run the image with new environment variables:

<br>

```plain
docker run -d --name sample-app-2 -e key2=value2 -e key1=new-value1 sample-image
```{{exec}}

<br>

Display the container's environment variables:

<br>

```plain
docker exec sample-app-2 env
```{{exec}}
