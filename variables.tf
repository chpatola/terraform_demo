variable "project" {
  type = string
  description = "The Google Cloud Project Used"
}
variable "location" {
  type        = string
  description = "The location for the Resource"
}
variable "bq_default_table_expiration_ms" {
  type        = number
  description = "How long time Big Query Table will be kept before destruction"
}
variable "bq_deletion_protection" {
  type = bool
  description = "Shall table have deletion protection or not"
}
variable "bq_use_legacy_sql" {
  type = bool
  description = "Shall legacy sql be used in query or not"
}

# Variables that will be provided by GithUb secrets
variable "bucket" {}
variable "credentials" {}