terraform {
  backend "gcs"{
    bucket      = "gcp-demo1-state"
    prefix      = "app1"
    credentials = "/Users/admin/Documents/projects/gcp-demo1/gcp-demo1.json"
  }
}
