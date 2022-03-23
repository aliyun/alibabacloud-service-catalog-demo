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



variable "vpc_id" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::ECS::VPC::VPCId",
    "AssociationPropertyMetadata": {
        "RegionId": "$${region_id}"
    },
    "Description": "Select a VPC ID.",
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
        "ZoneId": "$${redis_ZoneId}",
        "VpcId": "$${vpc_id}"
    },
    "Description": "Select a VSwitch ID.",
    "Label": "vswitchId"
  }
  EOT
}

variable "redis_ZoneId" {
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


variable "payment_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["PrePaid","PostPaid"],
    "Default": "PostPaid",
    "Label": "redis payment_type",
    "Description" : "redis payment type."
  }
  EOT
}

variable "db_instance_name" {
  default = ""
}

variable "instance_type" {
  default = "Redis"
}

variable "engine_version" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["4.0","5.0"],
    "Default": "4.0",
    "Label": "engine_version",
    "Description" : "redis engine version"
  }
  EOT
}


variable "instance_class" {
  type        = string
  description = "The type of the Redis instance."
  default     = "redis.master.small.default"
}

variable "private_ip" {
  type        = string
  description = "The internal IP address of the instance. Must be in the private_ip Classless Inter-Domain Routing (CIDR) block of the VSwitch to which the instance belongs."
  default     = ""
}

variable "security_ips" {
  type        = list(string)
  description = "The IP address in the whitelist group. The maximum number of IP addresses in the whitelist group is 1000."
  default     = ["10.0.1.1", "172.16.0.1"]
}

variable "account_password" {
  type        = string
  description = "The password for the (sensitive) account. The password must be 8 to 32 characters in length. It must contain at least three types of characters: uppercase letters, lowercase letters, digits, and special characters."
  default     = ""
}

variable "account_name" {
  default = ""
}
