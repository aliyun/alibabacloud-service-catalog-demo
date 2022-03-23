resource "alicloud_cr_ee_sync_rule" "default" {
  instance_id           = var.instance_id
  namespace_name        = var.namespace_name
  name                  = var.name
  target_region_id      = var.target_region_id
  target_instance_id    = var.target_instance_id
  target_namespace_name = var.target_namespace_name
  tag_filter            = var.tag_filter
  #  repo_name             = var.repo_name
  #  target_repo_name      = var.target_repo_name
}
