$LOCATION = ""
$PROJECT_ID = ""
$APP = ""
$VERSION = ""
$IMAGE = "${APP}:${VERSION}"
$REPOSITORY_NAME = ""
$GCP_IMAGE = "${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${REPOSITORY_NAME}/${IMAGE}"

docker build -t ${IMAGE} . --no-cache
docker tag ${IMAGE} ${GCP_IMAGE}
docker push ${GCP_IMAGE}
