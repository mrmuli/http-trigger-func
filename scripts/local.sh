#!/usr/bin/env bash

echo "Launching Docker Container..."
{
	docker run josephmuli/http-trigger-func:1.0
}  &> /dev/null
curl localhost:8080