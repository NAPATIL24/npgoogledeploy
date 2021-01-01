terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {

  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}
resource "google_compute_instance" "default" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags         = ["web", "dev"]

  boot_disk {
    initialize_params {
             image = "debian-cloud/debian-9"

    }
  }
  network_interface {
      network = "default"
      access_config {
      }
    }
  }
