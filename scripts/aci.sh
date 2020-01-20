#!/usr/bin/env bash

echo "Launching ACI Instance..."

resource_group="redemption-song"

{
    # direct invocation
    az container create --resource-group $resource_group --name functions-demo --image josephmuli/http-trigger-func:1.0 --ip-address public --dns-name-label functions-demo --no-wait
    
    # create via a template file
    # az group deployment create --resource-group $resource_group --template-file aci-template.json --no-wait
} &> /dev/null

echo "done"
