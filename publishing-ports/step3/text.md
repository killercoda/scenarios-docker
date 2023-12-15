
Connect via SSH to the host named `node01`.

Issue GET requests to both `controlplane:80` and `controlplane:81`. 
The hostname 'controlplane' refers to the host where you've recently set up containers.


<br>
<details><summary>Info</summary>
<br>

```plain
Documentation - https://docs.docker.com/network/#published-ports.
```

</details>

<br>
<details><summary>Tip 1</summary>
<br>

```plain
If you include the localhost IP address (127.0.0.1) with the publish flag, 
only the Docker host can access the published container port.

To ssh use "ssh node01" command.
```

</details>

<br>
<details><summary>Tip 2</summary>
<br>

```plain
You should expect an error message "Failed to connect to controlplane port 81: Connection refused" 
upon executing the "curl controlplane:81" command.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Connect via SSH to the host named `node01`:

<br>

```plain
ssh node01
```{{exec}}

<br>

Send get request to `controlplane:80`:

<br>

```plain
curl controlplane:80
```{{exec}}

<br>

Send get request to `controlplane:81`:

<br>

```plain
curl controlplane:81
```{{exec}}

</details>