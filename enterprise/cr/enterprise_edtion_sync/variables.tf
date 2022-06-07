variable "instance_id" {
  type        = string
  description = "ID of Container Registry Enterprise Edition source instance."
  default     = ""
}

variable "namespace_name" {
  type        = string
  description = "Name of Container Registry Enterprise Edition source namespace. It can contain 2 to 30 characters."
  default     = ""
}

variable "name" {
  type        = string
  description = "Name of Container Registry Enterprise Edition sync rule."
  default     = ""
}

variable "target_region_id" {
  type        = string
  description = "The target region to be synchronized."
  default     = ""
}

variable "target_instance_id" {
  type        = string
  description = "ID of Container Registry Enterprise Edition target instance to be synchronized."
  default     = ""
}

variable "target_namespace_name" {
  type        = string
  description = "Name of Container Registry Enterprise Edition target namespace to be synchronized. It can contain 2 to 30 characters."
  default     = ""
}

variable "tag_filter" {
  type        = string
  description = "The regular expression used to filter image tags for synchronization in the source repository."
  default     = ".*"
}

#variable "repo_name" {
#  type        = string
#  description = "Name of the source repository which should be set together with target_repo_name, if empty means that the synchronization scope is the entire namespace level."
#  default     = ""
#}

#variable "target_repo_name" {
#  type        = string
#  description = "Name of the target repository."
#  default     = ""
#}
