# LightWeight Docker image for the Google Cloud SDK

-   Image based on alpine linux
-   Minimal Docker image for gcloud

## Usage Guide

Pull this image Docker Hub:
```console
docker pull dwdraju/alpine-gcloud:latest
```

### Browser Authentication
To authenticate the gcloud sdk docker image using browser authentication, run
```console
docker run -ti --name gsdocker dwdraju/alpine-gcloud gcloud auth login
```

### Service Account Authentication
-   Create service account from *IAM & admin*
-   Download the key file in json format and paste it on service-account-key.json
-   Give permission to the service account as per requirement
-   Get the *GCLOUD_PROJECT_ID-   and set it as environment variable: `export GCLOUD_PROJECT_ID=myprojectID`
-   Run the command:
```console
docker run -ti -v $(pwd)/service-account-key.json:/service-account-key.json --name gcdocker dwdraju/alpine-gcloud gcloud auth activate-service-account --key-file=/service-account-key.json  --project "$GCLOUD_PROJECT_ID" --quiet
```

Additional flags like `ACCOUNT_NAME`, `--prompt-for-password` can be used during authentication. Full list is on [Cloud SDK doc](https://cloud.google.com/sdk/gcloud/reference/auth/activate-service-account)

### Usage
The docker image can be used to access resources in google cloud as bounded by IAM permission using the volume.
To list the container clusters:
```console
docker run --rm -ti --volumes-from gcdocker dwdraju/alpine-gcloud gcloud container clusters list
```
