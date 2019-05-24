provider "google" {
  project     = "${var.project_id}"
  region      = "${var.region}"
  credentials = "${file(var.credentials_path)}"
}

provider "google-beta" {
  project     = "${var.project_id}"
  region      = "${var.region}"
  credentials = "${file(var.credentials_path)}"
}

resource "google_compute_network" "vpc" {
  name                    = "test-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "subnet1"
  ip_cidr_range = "10.2.0.0/16"
  network       = "${google_compute_network.vpc.self_link}"
}

resource "google_compute_subnetwork" "subnet2" {
  name          = "subnet2"
  ip_cidr_range = "10.3.0.0/16"
  network       = "${google_compute_network.vpc.self_link}"
}

resource "google_compute_shared_vpc_host_project" "host" {
  project = "${var.project_id}"
}
