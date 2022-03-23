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


resource "alicloud_db_instance" "rds" {
  zone_id                  = var.rds_ZoneId
  engine                   = var.engine_id
  engine_version           = var.EngineVersion
  instance_type            = var.db_instance_type
  instance_storage         = var.db_storage
  instance_charge_type     = var.db_instance_charge_type
  instance_name            = var.rds_name
  vswitch_id               = var.VSwitchId
  monitoring_period        = var.monitoring_period
  db_instance_storage_type = var.db_instance_storage_type
}
