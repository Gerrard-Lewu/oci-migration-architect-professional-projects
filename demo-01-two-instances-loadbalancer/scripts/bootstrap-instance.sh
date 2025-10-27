#!/bin/bash
# Basic bootstrap for demo: create a simple web page and run a python HTTP server
set -e
if [ -f /etc/debian_version ]; then
  apt-get update -y
  apt-get install -y python3
else
  yum update -y
  yum install -y python3
fi

mkdir -p /opt/demo
cat > /opt/demo/index.html <<EOL
<html><body><h1>Instance: $(hostname)</h1><p>Demo Web Server</p></body></html>
EOL

nohup python3 -m http.server 8080 --directory /opt/demo >/var/log/demo-web.log 2>&1 &
