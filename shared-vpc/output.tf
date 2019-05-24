output "subnet_list" {
  value = [
    "${google_compute_subnetwork.subnet1.self_link}",
    "${google_compute_subnetwork.subnet2.self_link}",
  ]
}
