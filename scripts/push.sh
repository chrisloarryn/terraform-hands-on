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

# deploy to Cloud Run with name movil-app-backend on port 3000 and pass all environment variables from ./env/properties.env file
echo "Deploying image ${IMAGE} to Cloud Run"
gcloud run deploy ${APP} \
  --image ${GCP_IMAGE} \
  --platform managed \
  --region ${LOCATION} \
  # --allow-unauthenticated \
  --service-account "./keys/service-account.json" \
  --port 3000 \
	--memory 512Mi \
	# set name APP splitted by / as NAME environment variable
	--set-env-vars NAME=movil-app-backend \
	--cpu 1 \
	--timeout 60 \
	--max-instances 1 \
	--min-instances 1 \
	--concurrency 80 \
	--no-traffic \
	## pass all environment variables from ./env/properties.env file to Cloud Run separately as --set-env-vars
	--set-env-vars $(cat ./env/properties.env | tr '\n' ',') \
	--quiet || exit 1