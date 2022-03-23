resource "alicloud_eip" "example" {
  address_name         = var.eip_name
  description          = var.description
  bandwidth            = var.bandwidth
  internet_charge_type = var.internet_charge_type
  payment_type         = var.payment_type
  #  period               = var.period
  isp = var.isp
  #  resource_group_id    = var.resource_group_id
  #  deletion_protection  = var.deletion_protection
}
