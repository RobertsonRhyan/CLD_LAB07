/* Print values in the CLI output after running terraform apply
  Here the External IP of the instance will be displayed
*/
output "gce_instance_ip" {
  value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}
