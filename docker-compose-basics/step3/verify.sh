#!/bin/bash

LOGFILE=/ks/step3-verify.log
set -e

{
    date

    # Check if docker-compose.yml has been updated
    grep -q "depends_on:" /root/full-stack/docker-compose.yml
    grep -q "container_name: app-frontend" /root/full-stack/docker-compose.yml
    grep -q "container_name: app-database" /root/full-stack/docker-compose.yml
    
    # Check if containers are running with correct names
    docker ps | grep app-frontend
    docker ps | grep app-database
    
    # Test network connectivity
    docker exec app-frontend ping -c 2 app-database
    docker exec app-frontend ping -c 2 database

} >> ${LOGFILE} 2>&1

echo "done"
