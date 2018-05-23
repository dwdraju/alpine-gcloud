# LightWeight Docker image for the Google Cloud SDK

* Image based on alpine linux
* Minimal Docker image for gcloud

## Usage

Pull this image Docker Hub:
```
docker pull dwdraju/alpine-gcloud:latest
```

#### Browser Authentication
To authenticate the gcloud sdk docker image using browser authentication, run
```
docker run -ti --name gsdocker dwdraju/alpine-gcloud gcloud auth login
```

#### Service Account Authentication
* Create service account from *IAM & admin*
* Download the key file in json format and paste it on gcloud.json
* Give permission to the service account as per requirement
* Get the *GCLOUD_PROJECT_ID*

Run the command:
```
docker run -ti -v $(pwd)/gcloud.json:/gcloud.json --name gcdocker dwdraju/alpine-gcloud gcloud auth activate-service-account --key-file=/gcloud.json  --project "$GCLOUD_PROJECT_ID" --quiet
```

Additional flags like `ACCOUNT_NAME`, `--prompt-for-password` can be used during authentication. Full list is on [Cloud SDK doc](https://cloud.google.com/sdk/gcloud/reference/auth/activate-service-account)

### Usage
The docker image can be used to access resources in google cloud as bounded by IAM permission using the volume.
To list the container clusters:
```
docker run --rm -ti --volumes-from gcdocker dwdraju/alpine-gcloud gcloud container clusters list
```
