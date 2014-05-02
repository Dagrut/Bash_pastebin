#!/bin/bash

PORT=${1:-8080}

nc_path=$(which nc.traditional) || { echo 'nc.traditional is required to run this script!'; exit 1; }

while "$nc_path" -l -p "$PORT" -e "./process.sh"; do
	date # Nothing :)
done
