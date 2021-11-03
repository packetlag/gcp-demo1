resource "google_monitoring_alert_policy" "spanner_cloudfunction_latency" {
  project      = "gcp-demo1-330914"
  display_name = "CloudFunction Exec Too Slow"
  combiner     = "OR"

  conditions {
    display_name           = "Spanner Function Exec Rate"

    condition_threshold {
      filter               = "metric.type=\"cloudfunctions.googleapis.com/function/execution_times\" resource.type=\"cloud_function\""
      duration             = "0s"
      comparison           = "COMPARISON_GT"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_PERCENTILE_99"
      }
      threshold_value      = "100000000"
      trigger {
        count              = 1
      }
    }
  }
  notification_channels    = "${concat(google_monitoring_notification_channel.default.*.id, google_monitoring_notification_channel.sms.*.id)}"
}
