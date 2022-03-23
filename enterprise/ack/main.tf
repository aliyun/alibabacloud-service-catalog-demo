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


resource "alicloud_cs_managed_kubernetes" "k8s" {
  cluster_domain               = var.cluster_domain
  cluster_spec                 = var.cluster_spec
  cpu_policy                   = var.cpu_policy
  deletion_protection          = var.deletion_protection
  enable_ssh                   = var.enable_ssh
  install_cloud_monitor        = var.install_cloud_monitor
  is_enterprise_security_group = var.is_enterprise_security_group
  load_balancer_spec           = var.load_balancer_spec
  name                         = var.kubernetes_name
  password                     = var.password
  new_nat_gateway              = var.new_nat_gateway
  node_cidr_mask               = var.node_cidr_mask
  node_port_range              = var.node_port_range
  os_type                      = var.os_type
  platform                     = var.platform
  pod_cidr                     = var.pod_cidr
  proxy_mode                   = var.proxy_mode
  service_cidr                 = var.service_cidr
  slb_internet_enabled         = var.slb_internet_enabled
  worker_disk_category         = var.worker_disk_category
  worker_disk_size             = var.worker_disk_size
  worker_instance_charge_type  = var.worker_instance_charge_type
  worker_number                = var.worker_number
  worker_vswitch_ids           = [var.VSwitchId]
  worker_instance_types        = [var.instance_type]

  runtime = {
    name    = var.runtime_name
    version = var.runtime_version
  }
}
