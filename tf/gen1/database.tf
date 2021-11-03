resource "google_sql_database_instance" "master" {
  name = "gcp-demo1-sql"
  database_version = "MYSQL_5_7"
  region = var.region
  settings {
    tier = "db-n1-standard-2"
    ip_configuration {
      authorized_networks {
        name  = "gcp-demo1-green-list"
        value = "35.197.66.6/32"
      }
    }
  }
}

resource "google_sql_database" "database" {
  name = "app1-sql"
  instance = "${google_sql_database_instance.master.name}"
  charset = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "users" {
  name = "root"
  instance = "${google_sql_database_instance.master.name}"
  host = "%"
  password = "iShouldntBeInSourceControl"
}
