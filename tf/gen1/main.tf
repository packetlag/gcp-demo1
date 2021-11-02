// Source https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform

// Machine
resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.instance_machine_type
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }
  metadata = {
    ssh-keys = "admin:${file("~/.ssh/id_rsa.pub")}"
  }


// Flask how-to installs
metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

  service_account {
    scopes = ["storage-rw"]
  }

  allow_stopping_for_update = true

  network_interface {
    network = var.subnet_name

// Include this section to give the VM an external ip address
    access_config {
    }
  }
}

output "ip" {
 value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}

resource "google_compute_firewall" "default" {
 name    = "gcp-demo1-firewall"
 network = "default"

 allow {
   protocol = "tcp"
   ports    = ["5000"]
 }
}
