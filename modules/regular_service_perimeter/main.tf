resource "google_access_context_manager_service_perimeter" "service-perimeter" {
  provider       = "google-beta"
  parent         = "accessPolicies/${var.policy}"
  perimeter_type = "PERIMETER_TYPE_REGULAR"
  name           = "accessPolicies/${var.policy}/servicePerimeters/${var.perimeter_name}"
  title          = "${var.perimeter_name}"

  status {
    restricted_services   = "${var.restricted_services}"
    resources             = "${formatlist("projects/%s", var.resources)}"
    access_levels         = ["${formatlist("accessPolicies/${var.policy}/accessLevels/%s", var.access_levels)}"]
  }
}
