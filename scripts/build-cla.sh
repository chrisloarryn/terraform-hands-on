#!/bin/bash

if [ ! -f "./keys/service-account.json" ]; then
	echo "File ./keys/service-account.json does not exist. Please create it and try again"
	exit 1
fi

LOCATION="southamerica-west1"
PROJECT_ID="gcp-course-2024"
REPOSITORY_NAME="cloud-run-source-deploy"
APP="movil-app-backend"
VERSION="1.1"
IMAGE="${APP}:${VERSION}"
GCP_IMAGE="${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${REPOSITORY_NAME}/${IMAGE}"

echo "Building image ${IMAGE}"
docker build -t ${IMAGE} . --no-cache --progress=plain

echo "Tagging image ${IMAGE}"
docker tag ${IMAGE} ${GCP_IMAGE}

if [[ "$(docker images -q ${IMAGE} 2> /dev/null)" == "" ]]; then
  echo "Image ${IMAGE} does not exist. Building image"
  docker build -t ${IMAGE} . --no-cache --progress=plain
else
  echo "Image ${IMAGE} exists. Using existing image"
fi

## echo "Authenticating to GCP"
## docker login -u _json_key --password-stdin https://gcr.io < ./keys/service-account.json

## echo "Authenticating to GCP"
## gcloud auth configure-docker us-central1-docker.pkg.dev
## 
echo "Pushing image ${IMAGE}"
docker push ${GCP_IMAGE} || exit 1