variable "vpc_id" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::ECS::VPC::VPCId",
    "AssociationPropertyMetadata": {
        "RegionId": "$${region_id}"
    },
    "Description": "Select a VPC.",
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
        "ZoneId": "$${ecs_ZoneId}",
        "VpcId": "$${vpc_id}"
    },
    "Description": "Select a vswitchId.",
    "Label": "vswitchId"
  }
  EOT
}

variable "ecs_ZoneId" {
  type        = string
  description = <<EOT
  { 
    "AssociationProperty": "ALIYUN::ECS::ZoneId",
    "AssociationPropertyMetadata": {
        "RegionId": "$${region_id}",
        "VpcId": "$${vpc_id}"
    }
  }
  EOT
}

variable "instance_type" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::ECS::Instance::InstanceType",
    "AssociationPropertyMetadata": {
        "RegionId": "$${region_id}",
        "ZoneId": "$${ecs_ZoneId}"
    }, 
    "Label": "ECS instance type"
  }
  EOT
}


variable "ImageId" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::ECS::Instance::ImageId",
    "AssociationPropertyMetadata": {
        "RegionId": "$${region_id}",
        "InstanceType": "$${instance_type}"
    }, 
    "Label": "Select a system Image"
  }
  EOT
}


#variable "SystemDisk" {
#  type        = string
#  description = <<EOT
#  {
#    "AllowedValues":["ephemeral_ssd","cloud_efficiency","cloud_ssd","cloud_essd","cloud"],
#    "Default": "cloud_essd",
#    "Label": "SystemDisk",
#    "Description" : "System disk type"
#  }
#  EOT
#}

variable "SystemDisk" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::ECS::Disk::SystemDiskCategory",
    "AssociationPropertyMetadata": {
        "RegionId": "$${region_id}",
        "ZoneId": "$${ecs_ZoneId}",
        "InstanceType": "$${instance_type}"
    }, 
    "Label": "ECS SystemDisk"
  }
  EOT
}


variable "ecs_name" {
  default = ""
}

variable "host_name" {
  default = ""
}

variable "password" {
  default = ""
}


variable "private_ip" {
  type        = string
  description = "ecs private ip"
  default     = ""
}

variable "system_disk_name" {
  default = ""
}
variable "description" {
  type        = string
  description = "description"
  default     = ""
}

variable "internet_max_bandwidth_out" {
  type        = number
  description = "The public network bandwidth of the system disk type. If the value is 0, the public IP address is not activated."
  default     = 0
}

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
