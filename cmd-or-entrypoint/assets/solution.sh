#!/bin/bash

cat > /root/Dockerfile <<EOF
FROM nginx
ENV key1=value1
EOF

