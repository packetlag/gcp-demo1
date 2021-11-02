// Cloud service provider
provider "google" {
  credentials = file("/Users/admin/Documents/projects/gcp-demo1/gcp-demo1.json")
  project     = "gcp-demo1-330914"
  region      = "us-west1"
}


