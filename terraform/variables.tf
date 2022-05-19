// https://www.terraform.io/language/values/variables

variable "gcp_project_id" {
  description = "Google Cloud Project ID (<project name> - <random number>)"
  type        = string
  nullable    = false
}

variable "gcp_service_account_key_file_path" {
  description = "Path to the Service account JSON file to access Google Cloud AP"
  type        = string
  nullable    = false
}

variable "gce_instance_name" {
  description = "VM instance name"
  type        = string
  nullable    = false
}

variable "gce_instance_user" {
  description = "Set instance user name"
  type        = string
  nullable    = false
}

variable "gce_ssh_pub_key_file_path" {
  description = "Path to public SSH key used to access the VM"
  type        = string
  nullable    = false
}
