#!/usr/bin/env bash


echo "deleting resources"


resource_group="redemption-song"

aci_flush(){
    az container delete --name functions-demo --resource-group $resource_group --no-wait

    az group deployment delete --name functions-demo  --resource-group $resource_group --no-wait
}

local_flush(){
    
    docker stop http-trigger-func && docker rm http-trigger-func
    
    docker rmi josephmuli/http-trigger-func:1.0
}


aci_flush
local_flush
