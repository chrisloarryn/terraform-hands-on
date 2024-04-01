

#!/bin/bash

# this script receives a map of key-value pairs and replaces the values in the manifest file
# iterates over the map and replaces the values in the manifest file

# like: LOCATION=westus,ENVIRONMENT=dev
# # Reemplazar 'LOCATION' con el valor de la variable de entorno 'REGION'
#sed -i "s/LOCATION/${REGION}/g" /home/runner/work/movil-app-backend/movil-app-backend/k8s/deployment.yaml 
# Reemplazar 'ENVIRONMENT' con el valor de la variable de entorno 'DEPLOY_ENV'
#sed -i "s/ENVIRONMENT/${DEPLOY_ENV}/g" /home/runner/work/movil-app-backend/movil-app-backend/k8s/deployment.yaml
# Asume que el primer argumento es el nombre del archivo
MANIFEST_FILE_NAME=$1
$PWD=$(pwd)

echo "Current directory: $PWD"
echo "Manifest file: $MANIFEST_FILE_NAME"

# replace iteratin over the map
for pair in "$@"; do
  KEY=$(echo $pair | cut -d'=' -f1)
  VALUE=$(echo $pair | cut -d'=' -f2)
  echo "Replacing $KEY with $VALUE"

  # echo find $PWD/k8s/deployment.yaml -type f -exec sed -i "s/${KEY}/${VALUE}/g" {} \;
  # if $PWD starts with /home/runner/work/ then use '/home/runner/work/movil-app-backend/movil-app-backend/k8s/deployment.yaml'
  # else use $PWD/k8s/deployment.yaml
  if [[ $PWD == /home/runner/work/* ]]; then
    echo "Using full path"
    # if linux
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      echo "Linux"
      find /home/runner/work/movil-app-backend/movil-app-backend/k8s/$MANIFEST_FILE_NAME -type f -exec sed -i "s/${KEY}/${VALUE}/g" {} \;
    fi
    # if macos
    if [[ "$OSTYPE" == "darwin"* ]]; then
      echo "MacOS"
      find /home/runner/work/movil-app-backend/movil-app-backend/k8s/$MANIFEST_FILE_NAME -type f -exec sed -i '' "s/${KEY}/${VALUE}/g" {} \;
    fi
    echo "Replaced"
  else
    echo "Using relative path"
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      echo "Linux"
      find $PWD/k8s/$MANIFEST_FILE_NAME -type f -exec sed -i "s/${KEY}/${VALUE}/g" {} \; 
    fi

    if [[ "$OSTYPE" == "darwin"* ]]; then
      echo "MacOS"
      find $PWD/k8s/$MANIFEST_FILE_NAME -type f -exec sed -i '' "s/${KEY}/${VALUE}/g" {} \;
    fi
    echo "Replaced"
  fi
  
  #sed -i '' "s/${KEY}/${VALUE}/g" $PWD/k8s/deployment.yaml
done

# should be used as 
# ```yaml
# - name: Replace environment variables in manifest file
# 	run: ./.github/workflows/scripts/replace-env.sh LOCATION=${REGION} ENVIRONMENT=${DEPLOY_ENV}
# ```
