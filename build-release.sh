#!/bin/zsh

docker build -t dlauncher-builder .
docker compose up
docker compose down
