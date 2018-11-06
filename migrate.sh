#!/usr/bin/env bash

if [ -z ${1+x} ]; then echo "DB_NAME is unset"; else echo "DB_NAME is set to '$1'"; fi
if [ -z ${2+x} ]; then echo "DB_USER is unset"; else echo "DB_USER is set to '$2'"; fi
if [ -z ${3+x} ]; then echo "DB_PASSWORD is unset"; else echo "DB_PASSWORD is set to '$3'"; fi

docker \
  run \
  --rm \
  -v $PWD/sql:/flyway/sql \
  -v $PWD/conf:/flyway/conf \
  -v $PWD/jar:/flyway/jars \
  wyhitomi/flyway \
  migrate -url= -schemas=$1 -user=$2 -password=$3 -connectRetries=60 migrate
