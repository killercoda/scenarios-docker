#!/bin/bash

LOGFILE=/ks/step4-verify.log
set -e

{
    date

    # Check if docker-compose.yml exists
    test -f /root/scaling-demo/docker-compose.yml
    
    # Check if the file contains worker service
    grep -q "worker:" /root/scaling-demo/docker-compose.yml
    
    # Check if service is running
    cd /root/scaling-demo
    
    # Verify 3 instances are running
    worker_count=$(docker-compose ps | grep worker | grep Up | wc -l)
    if [ "$worker_count" -eq 3 ]; then
        echo "3 worker instances confirmed"
    else
        echo "Expected 3 workers, found $worker_count"
        exit 1
    fi

} >> ${LOGFILE} 2>&1

echo "done"
