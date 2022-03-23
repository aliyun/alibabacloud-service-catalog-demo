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

variable "vsw01_ZoneId" {
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

variable "vsw02_ZoneId" {
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

variable "VSwitch01_Id" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::ECS::VSwitch::VSwitchId",
    "AssociationPropertyMetadata": {
        "RegionId": "$${region_id}",
        "ZoneId": "$${vsw01_ZoneId}",
        "VpcId": "$${vpc_id}"
    },
    "Description": "Select a VSwitch01 ID。",
    "Label": "vswitch01_Id"
  }
  EOT
}

variable "VSwitch02_Id" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::ECS::VSwitch::VSwitchId",
    "AssociationPropertyMetadata": {
        "RegionId": "$${region_id}",
        "ZoneId": "$${vsw02_ZoneId}",
        "VpcId": "$${vpc_id}"
    },
    "Description": "Select a VSwitch02 ID。",
    "Label": "vswitch02_Id"
  }
  EOT
}


variable "address_allocated_mode" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["Fixed","Dynamic"],
    "Default": "Fixed",
    "Label": "address_allocated_mode",
    "Description" : "The method of assigning an IP address. Valid values: Fixed and Dynamic. * Fixed: The ALB instance uses a fixed IP address. * Dynamic: Dynamically assign an IP address to each region of the ALB instance."
  }
  EOT
}

variable "address_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["Internet","Intranet"],
    "Default": "Internet",
    "Label": "address_type",
    "Description" : "The type of IP address used by the ALB instance."
  }
  EOT
}

variable "load_balancer_name" {
  type        = string
  description = "ALB name"
  default     = ""
}

variable "pay_type" {
  type        = string
  description = "The billing method of the ALB instance. Valid values: PayAsYouGo."
  default     = "PayAsYouGo"
}

variable "load_balancer_edition" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["Basic","Standard"],
    "Default": "Standard",
    "Label": "load_balancer_edition",
    "Description" : "The version of the ALB instance. Different versions have different limits and billing methods."
  }
  EOT
}
