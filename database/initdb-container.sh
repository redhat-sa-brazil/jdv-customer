#!/bin/sh

echo "starting PGSQL Docker Container..."

docker run --name postgres-demo --rm \
-p 5432:5432 \
-e POSTGRES_USER=redhat \
-e POSTGRES_PASSWORD=redhat@123 \
-e POSTGRES_DB=cadastro_cliente \
-d postgres:latest

echo "wait a litle until the container starts up..."
sleep 10

echo "creating demo schema..."

docker run -it --rm \
--link postgres-demo:postgres \
-v "$(pwd)"/postgresql:/tmp/schemas:z \
postgres:latest \
psql -h postgres -U redhat -d cadastro_cliente -f /tmp/schemas/schema.sql

docker run -it --rm \
--link postgres-demo:postgres \
postgres:latest \
psql -h postgres -U redhat -d cadastro_cliente -c '\x' -c 'SELECT * FROM CADASTRO_CLIENTE LIMIT 3;'
