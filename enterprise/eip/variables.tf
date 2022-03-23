variable "eip_name" {
  default = ""
}

variable "description" {
  type        = string
  description = "The description of the EIP instance. The description can be a string of 2 to 256 characters in length and cannot start with http:// or https. The default value is empty."
  default     = null
}

variable "bandwidth" {
  type        = number
  description = "The maximum bandwidth of the elastic public network, measured in Mbit/s (Mbit/s). If this value is not specified, it is automatically set to 5 Mbps."
  default     = 10
}

variable "payment_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["Subscription","PayAsYouGo"],
    "Default": "PayAsYouGo",
    "Label": "payment_type",
    "Description" : "The billing method of the Elastic IP address. "
  }
  EOT
}

variable "internet_charge_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["PayByBandwidth","PayByTraffic"],
    "Default": "PayByTraffic",
    "Label": "internet_charge_type",
    "Description" : "Internet charge type of EIP."
  }
  EOT
}

#variable "period" {
#  type        = number
#  description = "The duration of the resource you will purchase, in months. Effective PrePaid when instance_charge_typeis. Valid values:[1-9, 12, 24, 36]. Currently, the provider does not support modifying the Period. You can use the Web console to modify the period. Note: This property period is only used to create Subscription instances or modify PayAsYouGo instances to Subscription. Once it takes effect, it will not be modified, which means that the running TerraForm apply will not affect the resources."
#  default     = "1"
#}

variable "isp" {
  type        = string
  description = "The type of the EIP instance. The default value is BGP. For other types of ISPs, you must enable the whitelist."
  default     = "BGP"
}

#variable "resource_group_id" {
#  type        = string
#  description = "The ID of the resource group to which the EIP belongs."
#  default     = null
#}

#variable "deletion_protection" {
#  type        = bool
#  description = "Is delete protection enabled"
#  default     = false
#}
