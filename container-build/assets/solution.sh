#!/bin/bash

cat > /root/Dockerfile <<EOF
FROM bash
CMD ["ping", "killercoda.com"]
EOF

podman build -t pinger .

podman run -d --name my-ping pinger

podman tag pinger local-registry:5000/pinger

podman push local-registry:5000/pinger

podman tag pinger pinger:v1
podman tag pinger local-registry:5000/pinger:v1

podman push local-registry:5000/pinger:v1
