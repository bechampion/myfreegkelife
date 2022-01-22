.PHONY: default
default: apply
init:
	rm -rf .terraform
ifeq ($(color),true)
	TC=""
else
	TC=" -no-color"
endif
	terraform init $(TC)
plan: init
	terraform plan $(TC) -out plan.out -detailed-exitcode ; echo $$? > status.out
destroy:
	terraform destroy $(TC)
apply: 
	terraform apply $(TC) plan.out
	@rm -rf *.out
auto-apply: init plan
	terraform apply $(TC) plan.out --auto-approve
creds:
	gcloud container clusters get-credentials myfreegke-zonal --project myfreegke  --region us-central1
gcloudsvcacct:
	gcloud auth activate-service-account 448328090095-compute@developer.gserviceaccount.com --key-file=$GOOGLE_APPLICATION_CREDENTIALS --project=myfreegke
