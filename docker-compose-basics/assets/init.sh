#!/bin/bash

cat <<EOT > /root/.vimrc
set expandtab
set tabstop=2
set shiftwidth=2
EOT

# init scenario
rm $0
mkdir -p /opt/ks

# Install docker-compose if not present
if ! command -v docker-compose &> /dev/null; then
    curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi

# Create working directories
mkdir -p /root/compose-project
mkdir -p /root/web-app
mkdir -p /root/full-stack

# Create a simple HTML file for nginx
echo "<h1>Hello from Docker Compose!</h1>" > /root/web-app/index.html

# Create a simple app for multi-service demo
cat > /root/full-stack/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Full Stack App</title>
</head>
<body>
    <h1>Full Stack Application</h1>
    <p>Frontend served by Nginx</p>
</body>
</html>
EOF

# mark init finished
touch /ks/.initfinished
