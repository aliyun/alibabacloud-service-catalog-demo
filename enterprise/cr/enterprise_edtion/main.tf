resource "alicloud_cr_ee_instance" "my-instance" {
  payment_type = var.payment_type
  period       = var.period
  #  renew_period        = var.renew_period
  renewal_status = var.renewal_status
  instance_type  = var.instance_type
  instance_name  = var.instance_name
}


resource "alicloud_cr_ee_namespace" "my-namespace" {
  instance_id        = alicloud_cr_ee_instance.my-instance.id
  name               = var.namespace_name
  auto_create        = var.auto_create
  default_visibility = var.default_visibility
}
