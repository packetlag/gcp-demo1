resource "google_spanner_instance" "default" {
  config           = "regional-us-central1"
  project          = "gcp-demo1-330914"
  display_name     = "gcp-demo1-beta"
  name             = "gcp-demo1-beta"
  processing_units = 100
}

resource "google_spanner_database" "database" {
  instance = google_spanner_instance.default.name
  name     = "gcp-demo1-db"
  ddl = [
    "CREATE TABLE demo1 (value1 STRING(1024),) PRIMARY KEY(value1)",
  ]
  deletion_protection = false
}
