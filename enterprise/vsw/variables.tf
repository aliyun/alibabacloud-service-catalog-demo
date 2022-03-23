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

variable "zone_id" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::ECS::ZoneId",
    "Label": "Select a zone"
  }
  EOT
}

variable "vsw_cidr_block" {
  type        = string
  description = "The CIDR block of the VSwitch must be a proper subset of the CIDR block of the VPC to which it belongs, and the mask must be between 16 and 29 bits. It can provide 8 to 65536 addresses. For example, if the CIDR block of a VPC is 10.0.0.0/16, the CIDR block of the VSwitch in the VPC is 10.0.0.0/17 to 10.0.0.0/29."
  default     = "10.0.0.0/24"
}

variable "vswitch_name" {
  default = "tf_test_foo"
}
