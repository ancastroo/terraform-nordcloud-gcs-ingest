variable "project_id" {}
variable "region" {}
variable "zone" {}

variable "gcs_transfer" {}

variable "schedule_year" {}
variable "schedule_month" {}
variable "schedule_day" {}

variable "end_bucket_name" {}

variable "end_bucket" {}

variable "source_buckets_list" {
    type = map(any)
}