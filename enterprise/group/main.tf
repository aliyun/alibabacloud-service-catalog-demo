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

