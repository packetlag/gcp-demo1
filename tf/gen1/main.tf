// Source https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform

// Cloud service provider
provider "google" {
  credentials = file("/Users/admin/Documents/projects/gcp-demo1/gcp-demo1.json")
  project     = "gcp-demo1-330914"
  region      = "us-west1"
}

// Machine
resource "google_compute_instance" "default" {
  name         = "app-1"
  machine_type = "f1-micro"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  metadata = {
    ssh-keys = "admin:${file("~/.ssh/id_rsa.pub")}"
  }


// Flask how-to installs
metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

  network_interface {
    network = "default"


// Include this section to give the VM an external ip address
    access_config {
    }
  }
}

output "ip" {
 value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}

