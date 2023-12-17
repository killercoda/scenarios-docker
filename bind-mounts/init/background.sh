#!/bin/bash

FILE=/ks/init.sh; while ! test -f ${FILE}; do clear; sleep 0.1; done; bash ${FILE} > /ks/init.log