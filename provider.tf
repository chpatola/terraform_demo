terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.41.0"
    }
  }
  backend "gcs" {
    bucket = "chpa_terraformdemo_backend_bucket"
    # Uncomment below if terraform is deployed from local
    #credentials = "terraform_gcloud_keys.json" 
  }

}

provider "google" {
  project     = var.project
  region      = "europe-west3"
  zone        = "europe-west3-a"
  # Uncomment below if terraform is deployed from local
  #credentials = "terraform_gcloud_keys.json" 
}
