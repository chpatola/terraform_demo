# Manage Big Query Resources via Terraform

## Steps to setup this Repo

### For local Terraform use
1. Make sure you have a service account with proper access to the resources you will create
2. Take the key from this service account and save as terraform_gcloud_keys.json. Refer to it in the backend block in  providers.tf.
3. Create a bucket where the Terraform state file shall be stored. Refer to this bucket in the backend block in providers.tf. 
4. Make sure you have terraform downloaded locally. HOW?


### For Terraform use with GitHub Action
1. Initiate git in the repo and push to remote in GitHUb - HOW
2. Make sure you have a service account with proper access to the resources you will create
3. Take the key from this service account and save as a GitHub repo secret. Name it GCLOUD_SERVICE_ACCOUNT_KEY 
4. Create a bucket where the Terraform state file shall be stored. Refer to this bucket in the backend object in providers.tf
5. Set up an environment in the GitHub repo (Settings/Environments/New environment). Name it live. Make sure to tick Required reviewers and add people who need to be able to accept Terraform Apply.


## How to run

When you change any of the resources managed by Terraform (mainly in main.tf and resources folder), and push to remote main, a Terraform workflow (terraform.yaml) is initiated. A Terraform plan will be created under GitHub Actions. You can approve the plan and apply the changes if you have the right. Your changes are now live in GCP.

