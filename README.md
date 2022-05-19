# Cloud Computing

## LAB07: Infrastructure-as-Code and Configuration Management - Terraform, Ansible and GitLab

### TASK 2: CREATE A CLOUD INFRASTRUCTURE ON GOOGLE COMPUTE ENGINE WITH TERRAFORM

#### Deliverables Task 2

>Explain the usage of each provided file and its contents by directly adding comments in the file as needed (we must ensure that you understood what you have done). In the file variables.tf fill the missing documentation parts and link to the online documentation. Copy the modified files to the report.

```terraform
variable "gcp_project_id" {
  description = ""
  type        = string
  nullable    = false
}

variable "gcp_service_account_key_file_path" {
  description = ""
  type        = string
  nullable    = false
}

variable "gce_instance_name" {
  description = ""
  type        = string
  nullable    = false
}

variable "gce_instance_user" {
  description = ""
  type        = string
  nullable    = false
}

variable "gce_ssh_pub_key_file_path" {
  description = ""
  type        = string
  nullable    = false
}

```

>Explain what the files created by Terraform are used for.

>Where is the Terraform state saved? Imagine you are working in a team and the other team members want to use Terraform, too, to manage the cloud infrastructure. Do you see any problems with this? Explain.

>What happens if you reapply the configuration (1) without changing main.tf (2) with a change in main.tf? Do you see any changes in Terraform's output? Why? Can you think of exemples where Terraform needs to delete parts of the infrastructure to be able to reconfigure it?

>Explain what you would need to do to manage multiple instances.

>Take a screenshot of the Google Cloud Console showing your Google Compute instance and put it in the report.

![Google Compute Instance](/screenshots/02_01.png)

