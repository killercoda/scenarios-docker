
> Press Ctrl+c to exit the running container

Tag the image, which is currently tagged as `pinger`, also as `local-registry:5000/pinger`.

Then push the image into the local registry.

<br>
<details><summary>Solution</summary>
<br>

```plain
docker tag pinger local-registry:5000/pinger

docker image ls

docker push local-registry:5000/pinger
```{{exec}}

</details>
