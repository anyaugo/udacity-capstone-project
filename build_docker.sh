#!/usr/bin/env bash

# Authenticate ECS Repo
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/v4n3e9u9

# Build image
docker build -t chibsapp .

# Tag image
docker tag chibsapp:latest public.ecr.aws/v4n3e9u9/chibsapp:$1

# List images
docker image ls

# Push image to ECS docker Repo
docker push public.ecr.aws/v4n3e9u9/chibsapp:$1