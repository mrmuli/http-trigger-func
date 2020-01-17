#!/usr/bin/env bash

echo "Launching ACI Instance..."

resource_group="your-resource-group-here"

{
    az container create --resource-group $resource_group --name functions-demo --image josephmuli/http-trigger-func:1.0 --ip-address public
} &> /dev/null

echo "done"
