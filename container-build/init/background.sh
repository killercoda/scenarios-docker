#!/bin/bash

# will run in background. can setup various things for the scenario for user not to see
# DO NOT change file: add changes in init.sh

FILE=/ks/init.sh; while ! test -f ${FILE}; do clear; sleep 0.1; done; bash ${FILE} > /ks/init.log
