resource "alicloud_cr_namespace" "my-namespace" {
  name               = var.namespace
  auto_create        = var.auto_create
  default_visibility = var.default_visibility
}

resource "alicloud_cr_repo" "my-repo" {
  namespace = alicloud_cr_namespace.my-namespace.name
  name      = var.repo_name
  summary   = var.summary
  repo_type = var.repo_type
  detail    = var.detail
}
