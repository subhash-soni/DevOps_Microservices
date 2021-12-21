#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
docker tag p4udacity-image:v1 dockerss1/udacity:p4udacity
dockerpath=dockerss1/udacity:p4udacity

# Step 2:  
# Authenticate & tag
docker login -u dockerss1
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push dockerss1/udacity:p4udacity
