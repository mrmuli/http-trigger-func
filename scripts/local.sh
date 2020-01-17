#!/usr/bin/env bash

echo "Launching Docker Container..."
{
	docker run -d -p 80:80 josephmuli/http-trigger-func:1.0
} &> /dev/null

sleep 2 # Allow container to be resolvable. 1 sec wasn't enough.

curl http://localhost