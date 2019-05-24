provider "google" {
  region      = "${var.region}"
  credentials = "${file(var.credentials_path)}"
}

provider "google-beta" {
  region      = "${var.region}"
  credentials = "${file(var.credentials_path)}"
}

module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 2.0"

  name              = "ptest-1"
  random_project_id = "true"
  org_id            = "${var.org_id}"
  billing_account   = "${var.billing_account}"
  shared_vpc        = "${var.seed_project}"

  shared_vpc_subnets = ["${split(",", var.subnet_list)}"]

  activate_apis = [
    "compute.googleapis.com",
    "iam.googleapis.com",
  ]
}
