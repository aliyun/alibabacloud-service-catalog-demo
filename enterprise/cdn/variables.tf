variable "domain_name" {
  type        = string
  description = "The name of the accelerated domain. This name does not have a suffix, can be a string of 1 to 63 characters, can only contain alphanumeric characters or -, and must not start or end with -, and - must not be in the 3rd and 4th character positions at the same time. The suffix. sh and. tel are not supported. "
  default     = ""
}

variable "cdn_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["web","download","video"],
    "Default": "web",
    "Label": "Cdn type",
    "Description" : "The Cdn type of the acceleration domain."
  }
  EOT
}

variable "scope" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["domestic","overseas","global"],
    "Default": "global",
    "Label": "scope",
    "Description" : "The range of the acceleration domain. This parameter setting is only valid for international users and domestic users with L3 or above."
  }
  EOT
}

variable "sources_content" {
  type        = string
  description = "The source address. Valid values can be IP or domain names. Each project content cannot be repeated."
  default     = ""
}

variable "sources_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["ipaddr","domain","oss"],
    "Default": "ipaddr",
    "Label": "sources_type",
    "Description" : "sources type"
  }
  EOT
}

variable "sources_port" {
  type        = number
  description = <<EOT
  {
    "AllowedValues":[443,80],
    "Default": 80,
    "Label": "sources_port",
    "Description" : "sources port"
  }
  EOT
}

variable "sources_priority" {
  type        = number
  description = "The priority of the source. Valid values: 0-100."
  default     = 20
}

variable "sources_weight" {
  type        = number
  description = "The Source weight. The valid value is from 0-100. However, if the type is ipaddr, the value can only be 10."
  default     = 10
}

variable "function_name" {
  type        = string
  description = "function name"
  default     = ""
}

variable "arg_name" {
  type        = string
  description = "arg name"
  default     = ""
}

variable "arg_value" {
  type        = string
  description = "arg value"
  default     = ""
}
