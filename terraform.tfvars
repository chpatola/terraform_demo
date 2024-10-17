# Assignment of values to variables.
# One can create different versions of .tfvars for different environments. Then the name can be passed like this: terraform plan -var-file=”prod.tfvars”
project = "terraform-423819"
project_region = "europe-west3"
project_zone = "europe-west3-a"
location = "EU"
bq_default_table_expiration_ms = 3600000
bq_deletion_protection = false
bq_use_legacy_sql = false
