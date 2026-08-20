#!/bin/bash

cat <<EOT > /root/.vimrc
set expandtab
set tabstop=2
set shiftwidth=2
EOT

# init scenario
rm $0
mkdir -p /opt/ks

# scenario specific
mkdir -p /root/compose-project
mkdir -p /root/web-app
mkdir -p /root/full-stack

echo "<h1>Hello from Docker Compose!</h1>" > /root/web-app/index.html

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
