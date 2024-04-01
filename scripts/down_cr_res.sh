#!/bin/bash
# reutilizable function to find if a Cloud Run service exists or not
cr_exists() {
	local SERVICE_NAME=$1
	local LOCATION=$2
	local PROJECT_ID=$3

	# echo with colors: "gcloud run services describe "${SERVICE_NAME}" --platform managed --region "${LOCATION}" --project "${PROJECT_ID}""
	echo -e "gcloud run services describe "${SERVICE_NAME}" --platform managed --region "${LOCATION}" --project "${PROJECT_ID}""

	# get the service
	gcloud run services describe "${SERVICE_NAME}" --platform managed --region "${LOCATION}" --project "${PROJECT_ID}" &> /dev/null

	# return the result of the previous command
	return $?
}

cr_clean_artifact_registry() {
	# clean all and only save the latest; gcloud artifacts docker images delete "${GCP_IMAGE}-dev:latest" --delete-tags --quiet. but preserve the latest
	# echo the command
	echo -e "gcloud artifacts docker images delete "${GCP_IMAGE}-dev:latest" --delete-tags --quiet"
	gcloud artifacts docker images delete "${GCP_IMAGE}-dev" --delete-tags --quiet
	# gcloud artifacts docker images delete "southamerica-west1-docker.pkg.dev/safe-wave-377002/cloud-run-source-deploy/movil-app-backend--dev" --delete-tags=-latest --quiet
}



if [ ! -f "./keys/service-account.json" ]; then
	echo "File ./keys/service-account.json does not exist. Please create it and try again"
	exit 1
fi

LOCATION="southamerica-west1"
PROJECT_ID="safe-wave-377002"
REPOSITORY_NAME="cloud-run-source-deploy"
APP="movil-app-backend"
VERSION="1.1"
IMAGE="${APP}:${VERSION}"
GCP_IMAGE="${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${REPOSITORY_NAME}/${IMAGE}"
K8S_NAMESPACE="safe-wave-"
K8S_ENVIRONMENTS=("dev" "staging" "prod")
K8S_CLUSTER="safe-wave"
MY_GOOGLE_EMAIL="chrisloarryn@gmail.com"

# login to gcloud with MY_GOOGLE_EMAIL account which has the necessary permissions and is not a service account
gcloud auth login "${MY_GOOGLE_EMAIL}"

# echo with colors: "Logging in with service account"
echo -e "Logging in with service account"

# set project
gcloud config set project "${PROJECT_ID}"

echo "Project set to: ${PROJECT_ID}"

# echo the result of cr_exists "${APP}-${K8S_ENVIRONMENTS[0]}" "${LOCATION}" "${PROJECT_ID}"
if cr_exists "${APP}-${K8S_ENVIRONMENTS[0]}" "${LOCATION}" "${PROJECT_ID}"; then
	# echo with colors: "Service ${APP} exists"
	echo -e "Service ${APP}-${K8S_ENVIRONMENTS[0]} exists"
else
	# echo with colors: "Service ${APP} does not exist"
	echo -e "Service ${APP}-${K8S_ENVIRONMENTS[0]} does not exist"

	# so exit the script
	exit 0
fi


# when script receives ar=1, then execute the function cr_clean_artifact_registry and then exit
if [ "$1" == "1" ]; then
	cr_clean_artifact_registry
	exit 0
fi


# if exists then delete the other environments, except the first one
for (( i=1; i<${#K8S_ENVIRONMENTS[@]}; i++ )); do
	# echo the result of cr_exists "${APP}-${K8S_ENVIRONMENTS[i]}" "${LOCATION}" "${PROJECT_ID}"
	if cr_exists "${APP}-${K8S_ENVIRONMENTS[i]}" "${LOCATION}" "${PROJECT_ID}"; then
		# echo with colors: "Service ${APP} exists"
		echo -e "Service ${APP}-${K8S_ENVIRONMENTS[i]} exists"

		# echo with colors: "gcloud run services delete "${APP}-${K8S_ENVIRONMENTS[i]}" --platform managed --region "${LOCATION}" --project "${PROJECT_ID}" --quiet"
		echo -e "gcloud run services delete "${APP}-${K8S_ENVIRONMENTS[i]}" --platform managed --region "${LOCATION}" --project "${PROJECT_ID}" --quiet"

		# delete the service
		gcloud run services delete "${APP}-${K8S_ENVIRONMENTS[i]}" --platform managed --region "${LOCATION}" --project "${PROJECT_ID}" --quiet
	else
		# echo with colors: "Service ${APP} does not exist"
		echo -e "Service ${APP}-${K8S_ENVIRONMENTS[i]} does not exist"
	fi
done

# reducir al minimo el costo de la infraestructura del cloud run
# set the cpu to 1
# the memory to 256Mi
# the concurrency to 1
# the max instances to 2
# the timeout to 10m
# allow unauthenticated invocations
# and more to reduce costs, for the first environment, which is the dev environment
gcloud run services update "${APP}-${K8S_ENVIRONMENTS[0]}" --platform managed \
	--region "${LOCATION}" --project "${PROJECT_ID}" --cpu=1 --memory=256Mi --concurrency=1  \
	--max-instances=2 --timeout=10m	--quiet

# allow unauthenticated invocations
gcloud run services add-iam-policy-binding "${APP}-${K8S_ENVIRONMENTS[0]}" --platform managed \
	--region "${LOCATION}" --project "${PROJECT_ID}" --member=allUsers --role=roles/run.invoker --quiet




