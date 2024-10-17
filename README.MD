# Manage Big Query Resources via Terraform

## Steps to use this Repo

### For local Terraform use
1. Make sure you have a service account with proper access to the resources you will create
2. Take the key from this service account and save as terraform_gcloud_keys.json
3. Create a bucket where the Terraform state file shall be stored. Refer to this bucket in the backend object in providers.tf
4. Make sure you have terraform downloaded locally. HOW?
When you make a change in any of the resources managed by Terraform (mainly in main.tf and resources folder), and push to remote main, a Terraform workflow (terraform.yaml) is initiated. A Terraform plan will be created under GitHub Actions. If you have the rights, you can approve the plan and apply the changes. Your changes are now live in GCP.

### For Terraform use with GitHub Action
1. Initiate git in the repo and push to remote in GitHUb - HOW
Make sure you have a service account with proper access to the resources you will create
 Take the key from this service account and save as a GitHub repo secret. Name it GCLOUD_SERVICE_ACCOUNT_KEY 
Create a bucket where the Terraform state file shall be stored. Refer to this bucket in the backend object in providers.tf
Set up an environment in the GitHub repo (Settings/Environments/New environment). Name it live. Make sure to tick Required reviewers and add people that need to be able to accept Terraform Apply.
When you make a change in any of the resources managed by Terraform (mainly in main.tf and resources folder), and push to remote main, a Terraform workflow (terraform.yaml) is initiated. A Terraform plan will be created under GitHub Actions. If you have the rights, you can approve the plan and apply the changes. Your changes are now live in GCP.


## Next things to do
1. Update this readme to be proper 
