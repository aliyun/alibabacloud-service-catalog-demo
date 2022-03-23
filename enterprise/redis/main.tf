resource "alicloud_security_group" "group" {
  name   = var.group_name
  vpc_id = var.vpc_id
}

resource "alicloud_security_group_rule" "tcp_port" {
  count             = length(var.group_tcp_port)
  type              = var.group_type
  ip_protocol       = var.group_ip_protocol
  nic_type          = var.group_nic_type
  policy            = var.group_policy
  port_range        = var.group_tcp_port[count.index]
  priority          = var.group_priority
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = var.group_cidr_ip[count.index]
}


resource "alicloud_kvstore_instance" "default" {
  instance_class = var.instance_class
  instance_name  = var.db_instance_name
  payment_type   = var.payment_type
  vswitch_id     = var.VSwitchId
  private_ip     = var.private_ip
  security_ips   = var.security_ips
  instance_type  = var.instance_type
  engine_version = var.engine_version
  zone_id        = var.redis_ZoneId
}

resource "alicloud_kvstore_account" "example" {
  account_name     = var.account_name
  account_password = var.account_password
  instance_id      = alicloud_kvstore_instance.default.id
}
