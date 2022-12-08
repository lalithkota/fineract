#!/bin/bash

kubectl -n ${1:-default} create secret generic fineract-tenants-db-secret --from-literal=username=root --from-literal=password=$(head /dev/urandom | LC_CTYPE=C tr -dc A-Za-z0-9 | head -c 16)
kubectl -n ${1:-default} apply -f fineractmysql-configmap.yml
kubectl -n ${1:-default} apply -f fineractmysql-deployment.yml
kubectl -n ${1:-default} apply -f fineract-server-deployment.yml
kubectl -n ${1:-default} apply -f fineract-mifoscommunity-deployment.yml
kubectl -n ${1:-default} apply -f fineract-self-service-deployment.yml
