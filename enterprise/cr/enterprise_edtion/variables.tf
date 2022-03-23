variable "payment_type" {
  type        = string
  description = "Container Registry Enterprise Edition The subscription of the instance. Valid value: Subscription."
  default     = "Subscription"
}

variable "period" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["1","2","3","6","12","24","36","48","60"],
    "Default": "1",
    "Label": "period",
    "Description" : "Container Registry Enterprise Edition The service time of the instance. Unit: month."
  }
  EOT
}

#variable "renew_period" {
#  type        = number
#  description = <<EOT
#  {
#    "AllowedValues":["1","2","3","6","12","24","36","48","60"],
#    "Default": "1",
#    "Label": "renew_period",
#    "Description" : "Container Registry Enterprise Edition The renewal period of the instance. Unit: month."
#  }
#  EOT
#}

variable "renewal_status" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["AutoRenewal","ManualRenewal"],
    "Default": "ManualRenewal",
    "Label": "renewal_status",
    "Description" : "Container Registry Enterprise Edition The status of the instance."
  }
  EOT
}

variable "instance_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["Basic","Standard","Advanced"],
    "Default": "Advanced",
    "Label": "instance_type",
    "Description" : "Container Registry Enterprise Edition instance type。 Note: International accounts do not support Standard."
  }
  EOT
}

variable "instance_name" {
  default = ""
}


variable "namespace_name" {
  default = ""
}

variable "auto_create" {
  type        = bool
  description = "when it set to true, repositories are automatically created when pushing new images. If it set to false, you create repository for images before pushing."
  default     = false
}

variable "default_visibility" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["PUBLIC","PRIVATE"],
    "Default": "PUBLIC",
    "Label": "default_visibility",
    "Description" : "default repository visibility in this namespace."
  }
  EOT
}
