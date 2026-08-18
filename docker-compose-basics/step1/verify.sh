#!/bin/bash

LOGFILE=/ks/step1-verify.log
set -e

{
    date

    # Check if docker-compose.yml exists
    test -f /root/compose-project/docker-compose.yml
    
    # Check if the file contains required content
    grep -q "web:" /root/compose-project/docker-compose.yml
    grep -q "nginx:alpine" /root/compose-project/docker-compose.yml
    grep -q "8080:80" /root/compose-project/docker-compose.yml
    
    # Check if service is running
    cd /root/compose-project
    docker-compose ps | grep web | grep Up
    
    # Test if web server responds
    curl -s http://localhost:8080 | grep -q "Hello from Docker Compose"

} >> ${LOGFILE} 2>&1

echo "done"
