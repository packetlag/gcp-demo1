resource "google_monitoring_notification_channel" "default" {
  display_name = "GCP-DEMO1-EMAIL-ALERT"
  type         = "email"
  project      = "gcp-demo1-330914"
  labels = {
    email_address = "aclosey@gmail.com"
  }
}

resource "google_monitoring_notification_channel" "sms" {
  display_name = "GCP-DEMO1-SMS-ALERT"
  type         = "sms"
  project      = "gcp-demo1-330914"
  labels = {
    number = "+17032447011"
  }
}
