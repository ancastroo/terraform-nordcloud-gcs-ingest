# Resource for creating storage transfer job to Ingest from GCS
resource "google_storage_transfer_job" "gcs-transfer-service-job" {
  # If-statement to run gcs transfer
  for_each = var.gcs_transfer ? var.source_buckets_list : tomap({})

  description = "Ingest from GCS Bucket"
  project     = var.project_id

  transfer_spec {
    gcs_data_source {
      bucket_name = each.key
      path = ""
    }
    gcs_data_sink {
      bucket_name = google_storage_bucket.end_bucket.name
      path        = ""
    }
  }

  schedule {
    schedule_start_date {
      year  = var.schedule_year
      month = var.schedule_month
      day   = var.schedule_day
    }
    schedule_end_date {
      year  = var.schedule_year
      month = var.schedule_month
      day   = var.schedule_day
    }
  }

  depends_on = [google_storage_bucket_iam_member.default_sa_transfer_service_bucket_writer]
}
