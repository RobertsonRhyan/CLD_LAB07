# Cloud Computing

## LAB07: Infrastructure-as-Code and Configuration Management - Terraform, Ansible and GitLab

### TASK 2: CREATE A CLOUD INFRASTRUCTURE ON GOOGLE COMPUTE ENGINE WITH TERRAFORM

#### Deliverables Task 2

>Explain the usage of each provided file and its contents by directly adding comments in the file as needed (we must ensure that you understood what you have done). In the file variables.tf fill the missing documentation parts and link to the online documentation. Copy the modified files to the report.

main.tf

```terraform
/* Set a cloud provider, here it's google 
    - Set the project id (e.g. labce-350710)
    - Set the region (A region is a specific geographical location where you can run your resources)
    - Set the Service Account Key location
*/
provider "google" {
  project     = var.gcp_project_id
  region      = "europe-west6-a"
  credentials = file("${var.gcp_service_account_key_file_path}")
}

/* Set ressources for VM
  - Give the instance a name
  - Set type
  - Set zone of instance (A zone is an isolated location within a region. 
    The zone determines what computing resources are available and where your data is stored and used)
  - Setup SSH connection :
    - Get SSH user name from tf vars and set it
    - Get SSH public key location from tf vars and set it
  - Define what image to run on the instance
  - Setup network interface
*/
resource "google_compute_instance" "default" {
  name         = var.gce_instance_name
  machine_type = "f1-micro"
  zone         = "europe-west6-a"

  metadata = {
    ssh-keys = "${var.gce_instance_user}:${file("${var.gce_ssh_pub_key_file_path}")}"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}

/* Add firewall rule
  - Set name of rule
  - Set on which network to add rule
  - Set allowed source (here any IP)
  - Set allowed PORT (here 22 for SSH)
*/
resource "google_compute_firewall" "ssh" {
  name          = "allow-ssh"
  network       = "default"
  source_ranges = ["0.0.0.0/0"]
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
}

// Same as for SSH but for HTTP
resource "google_compute_firewall" "http" {
  name          = "allow-http"
  network       = "default"
  source_ranges = ["0.0.0.0/0"]
  allow {
    ports    = ["80"]
    protocol = "tcp"
  }
}
```



>Explain what the files created by Terraform are used for.

>Where is the Terraform state saved? Imagine you are working in a team and the other team members want to use Terraform, too, to manage the cloud infrastructure. Do you see any problems with this? Explain.

>What happens if you reapply the configuration (1) without changing main.tf (2) with a change in main.tf? Do you see any changes in Terraform's output? Why? Can you think of exemples where Terraform needs to delete parts of the infrastructure to be able to reconfigure it?

>Explain what you would need to do to manage multiple instances.

>Take a screenshot of the Google Cloud Console showing your Google Compute instance and put it in the report.

![Google Compute Instance](/screenshots/02_01.png)

