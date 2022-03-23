resource "alicloud_vswitch" "vsw" {
  vpc_id       = var.vpc_id
  vswitch_name = var.vswitch_name
  cidr_block   = var.vsw_cidr_block
  zone_id      = var.zone_id
}
