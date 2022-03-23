resource "alicloud_alb_load_balancer" "alb" {
  vpc_id                 = var.vpc_id
  address_type           = var.address_type
  address_allocated_mode = var.address_allocated_mode
  load_balancer_name     = var.load_balancer_name
  load_balancer_edition  = var.load_balancer_edition
  load_balancer_billing_config {
    pay_type = var.pay_type
  }
  zone_mappings {
    vswitch_id = var.VSwitch01_Id
    zone_id    = var.vsw01_ZoneId
  }
  zone_mappings {
    vswitch_id = var.VSwitch02_Id
    zone_id    = var.vsw02_ZoneId
  }
}
