variable "zone_id" {
  type        = string
  description = <<EOT
  { 
    "AssociationProperty": "ALIYUN::ECS::ZoneId",
    "AssociationPropertyMetadata": {
      "RegionId": "$${region_id}"
    },
    "Label": {
      "en": "Availability Zone",
      "zh-cn": "可用区"
    }
  }
  EOT
}

variable "vpc_cidr_block" {
  type        = string
  description = <<EOT
  { 
    "Label": {
      "en": "VPC CIDR Block",
      "zh-cn": "VPC网段"
    }
  }
  EOT
  default     = "172.16.0.0/12"
}

variable "vswitch_cidr_block" {
  type        = string
  description = <<EOT
  { 
    "Label": {
      "en": "VSwitch CIDR Block",
      "zh-cn": "VSwitch网段"
    }
  }
  EOT
  default     = "172.16.0.0/21"
}

variable "ecs_instance_type" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::ECS::Instance::InstanceType",
    "AllowedValues": ["ecs.s6-c1m1.small", "ecs.s6-c1m2.small", "ecs.s6-c1m2.large", "ecs.s6-c1m2.xlarge", "ecs.s6-c1m2.2xlarge"],
    "AssociationPropertyMetadata": {
      "RegionId": "$${region_id}",
      "ZoneId": "$${zone_id}"
    },
    "Label": {
      "en": "ECS Instance Type",
      "zh-cn": "ECS实例规格"
    }
  }
  EOT
}
