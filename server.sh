#!/bin/bash

PORT=${1:-8080}

while nc -l -p "$PORT" -e "./process.sh"; do
	date # Nothing :)
done
