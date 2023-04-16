
Without specifying a `:tag`, the default `:latest` will be used. Now we want to use tag `:v1` instead.

Tag the image, which is currently tagged as `pinger`, also as `pinger:v1` and `local-registry:5000/pinger:v1`.

Then push the image into the local registry.

<br>
<details><summary>Solution</summary>
<br>

```plain
docker tag pinger pinger:v1

docker tag pinger local-registry:5000/pinger:v1

docker image ls

docker push local-registry:5000/pinger:v1
```{{exec}}

</details>
