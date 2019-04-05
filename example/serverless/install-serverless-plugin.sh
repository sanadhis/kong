#!/bin/bash

# replace localhost:8001 with your kong hostname and port
# specify SERVICE_NAME in which this custom serverless plugin will be installed

curl -i -X POST --url http://localhost:8001/services/$SERVICE_NAME/plugins \
    -F "name=pre-function" \
    -F "config.functions=@$PWD/check_request_payload.lua"
