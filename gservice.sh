for i in $(gcloud projects list --quiet --format=json | jq '.[]|.projectId' -r ) ; do echo "Checking project $i ..."  ; [[ $(gcloud services list --project $i --format=json | jq '.[] | .config.name | select(. == "osconfig.googleapis.com")') ]] && echo "osconfig.googleapis.com is enabled already on project $i" || echo gcloud services enable osconfig.googleapis.com --project $i  ; done
