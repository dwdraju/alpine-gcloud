# Using gcloud container builder on Gitlab CE, EE or SaaS

* Copy the `.gitlab-ci.yml` and `cloudbuild.yaml` files on the root of the project
* Create service account from IAM section and download key file
* Give container builder, storage reader and log viewer permission to the service account
* Base64 encode the key file using command `base64 -w 0 keyfile.json`
* Set `GCLOUD_SERVICE_KEY` *Secret variables* from *CI/CD Settings* of the project
* Likewise, set `IMAGE_NAME` variable
* Push to any branch and it will trigger new build on Google Cloud Container Builder !!!
