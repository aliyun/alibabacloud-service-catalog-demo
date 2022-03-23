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

resource "alicloud_eci_container_group" "eci" {
  count = length(var.containers)

  container_group_name = var.container_group_name
  cpu                  = var.cpu
  memory               = var.memory
  restart_policy       = "OnFailure"
  security_group_id    = alicloud_security_group.group.id
  vswitch_id           = var.VSwitchId
  tags = {
    TF = "create"
  }

  dynamic "containers" {
    for_each = try(var.containers, {})

    content {
      name              = containers.value.name
      image             = containers.value.image
      commands          = try(containers.value.commands, null) #["",""]
      image_pull_policy = try(containers.value.image_pull_policy, "IfNotPresent")
      working_dir       = try(containers.value.working_dir, null)

      dynamic "ports" {
        for_each = try(containers.value.ports, {})

        content {
          port     = try(containers.value.ports.port, null)
          protocol = try(containers.value.ports.protocol, null)
        }
      }

      dynamic "volume_mounts" {
        for_each = try(containers.value.volume_mounts, {})

        content {
          mount_path = try(containers.value.volume_mounts.mount_path, null)
          name       = try(containers.value.volume_mounts.name, null)
          read_only  = try(containers.value.volume_mounts.read_only, null)
        }
      }
    }
  }

  volumes {
    name = var.volumes_name
    type = var.volumes_type
  }
}
