#!/bin/bash

LOGFILE=/ks/step2-verify.log
set -e

{
    date

    # Check if docker-compose.yml exists in correct directory
    test -f /root/full-stack/docker-compose.yml
    
    # Check if the file contains required services
    grep -q "frontend:" /root/full-stack/docker-compose.yml
    grep -q "database:" /root/full-stack/docker-compose.yml
    grep -q "postgres:14-alpine" /root/full-stack/docker-compose.yml
    grep -q "POSTGRES_USER" /root/full-stack/docker-compose.yml
    
    # Check if both services are running
    cd /root/full-stack
    docker-compose ps | grep frontend | grep Up
    docker-compose ps | grep database | grep Up
    
    # Test if frontend responds
    curl -s http://localhost:8080 | grep -q "Full Stack"

} >> ${LOGFILE} 2>&1

echo "done"
