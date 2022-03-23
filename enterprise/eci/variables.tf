variable "group_name" {
  default = ""
}

variable "group_tcp_port" {
  type        = list(string)
  description = "The initial open port of the default security group of the VPC"
  default     = ["22/22", "3389/3389"]
}

variable "group_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["ingress","egress"],
    "Default": "ingress",
    "Label": "group_type",
    "Description" : "The type of rule being created. Valid options are ingress (inbound) or egress (outbound)."
  }
  EOT
}

variable "group_ip_protocol" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["tcp","udp","icmp","gre","all"],
    "Default": "tcp",
    "Label": "ip_protocol",
    "Description" : "The protocol. Can be tcp, udp, icmp, gre or all."
  }
  EOT
}

variable "group_nic_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["internet","intranet"],
    "Default": "intranet",
    "Label": "Network type",
    "Description" : "Network type, can be either internet or intranet"
  }
  EOT
}

variable "group_policy" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["accept","drop"],
    "Default": "accept",
    "Label": "group_policy",
    "Description" : "Authorization policy, can be either accept or drop"
  }
  EOT
}

variable "group_priority" {
  type        = number
  description = "Authorization policy priority, with parameter values: 1-100."
  default     = 1
}

variable "group_cidr_ip" {
  type        = list(string)
  description = "The target IP address range. The default value is 0.0.0.0/0 (which means no restriction will be applied)."
  default     = ["10.0.0.0/8", "0.0.0.0/0"]
}

variable "zone_id" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::ECS::ZoneId",
    "Label": "Select a zone"
  }
  EOT
}

variable "vpc_id" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::ECS::VPC::VPCId",
    "AssociationPropertyMetadata": {
        "RegionId": "$${region_id}"
    },
    "Description": "Select a VPC。",
    "Label": "VPCId"
  }
  EOT
}

variable "VSwitchId" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::ECS::VSwitch::VSwitchId",
    "AssociationPropertyMetadata": {
        "RegionId": "$${region_id}",
        "ZoneId": "$${zone_id}",
        "VpcId": "$${vpc_id}"
    },
    "Description": "Select a vswitch ID。",
    "Label": "vswitchId"
  }
  EOT
}

variable "cpu" {
  default = "2"
}
variable "memory" {
  default = "4"
}
variable "container_group_name" {
  default = "testfoo"
}

variable "containers" {
  type = list(object({
    image             = string
    name              = string
    working_dir       = string
    image_pull_policy = string
    commands          = list(string)
    volume_mounts = object({
      mount_path = string
      read_only  = bool
      name       = string
    })
    ports = object({
      port     = number
      protocol = string
    })
  }))
}

variable "volumes_name" {
  default = "empty1"
}

variable "volumes_type" {
  default = "EmptyDirVolume"
}
