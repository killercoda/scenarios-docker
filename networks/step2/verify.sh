#!/bin/bash

# for Validator to verify as success, the script needs to exit with code 0 (no error)
# and HAS to ONLY output "done". Every other text output will be taken as error.

# NOTE: there seems to be a limit after which the Validator verify command is not valid, even
# though exit code 0 and "done" is returned. This could be after X amount of commands, or too
# long execution time, not sure why. Hence this file should be as short as possible.

LOGFILE=/ks/step1-verify.log
set -e # exit once any command fails

{
    date

    docker ps | grep app-1
    docker ps | grep app-2
    docker network inspect bridge-network | grep app-1
    docker network inspect bridge-network | grep app-2
    docker exec app-1 sh -c 'curl -sS app-2' | grep "Hello from the app-2"
    docker exec app-1 sh -c 'curl -sS 172.18.0.3' | grep "Hello from the app-2"

} >> ${LOGFILE} 2>&1

echo "done" # let Validator know success