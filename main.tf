# Datasets
resource "google_bigquery_dataset" "ds_finance" {
  dataset_id                  = "finance"
  friendly_name               = "Finance Dataset"
  description                 = "This dataset contains tables and views used by the finance department."
  location                    = var.location
  default_table_expiration_ms = var.bq_default_table_expiration_ms
}

resource "google_bigquery_dataset" "ds_hr" {
  dataset_id                  = "hr"
  friendly_name               = "HR Dataset"
  description                 = "This dataset contains tables and views used by the HR department."
  location                    = var.location
  default_table_expiration_ms = var.bq_default_table_expiration_ms
}

# Tables
resource "google_bigquery_table" "table_finance_budget" {
  dataset_id          = google_bigquery_dataset.ds_finance.dataset_id
  table_id            = "finance_budget_table"
  schema              = file("resources/schema/finance_budget_schema.json")
  deletion_protection = var.bq_deletion_protection
}

resource "google_bigquery_table" "table_HR_offboarding_survey" {
  dataset_id          = google_bigquery_dataset.ds_hr.dataset_id
  table_id            = "HR_offboarding_survey_table"
  schema              = file("resources/schema/hr_offboarding_survey_schema.json")
  deletion_protection = var.bq_deletion_protection
}

# Views
resource "google_bigquery_table" "view_finance_budget" {
  dataset_id = google_bigquery_dataset.ds_finance.dataset_id
  table_id   = "finance_budget_view"
  view {
    query = templatefile("resources/sql/finance_budget_view.sql",
      # Defining the variables used in the view SQL
      { project    = var.project,
        dataset_id = google_bigquery_table.table_finance_budget.dataset_id,
        table_id   = google_bigquery_table.table_finance_budget.table_id
      }
    )
    use_legacy_sql = var.bq_use_legacy_sql
  }
  deletion_protection = var.bq_deletion_protection
}


resource "google_bigquery_table" "view_HR_offboarding_survey" {
  dataset_id = google_bigquery_dataset.ds_hr.dataset_id
  table_id   = "HR_offboarding_survey_view"
  view {
    query = templatefile("resources/sql/HR_offboarding_survey_view.sql",
      # Defining the variables used in the view SQL
      { project    = var.project,
        dataset_id = google_bigquery_table.table_HR_offboarding_survey.dataset_id,
        table_id   = google_bigquery_table.table_HR_offboarding_survey.table_id
      }
    )
    use_legacy_sql = var.bq_use_legacy_sql
  }
  deletion_protection = var.bq_deletion_protection
}

