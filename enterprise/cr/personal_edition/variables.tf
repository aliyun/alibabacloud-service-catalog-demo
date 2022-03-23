variable "namespace" {
  type        = string
  description = "The name of the namespace."
  default     = ""
}

variable "auto_create" {
  type        = bool
  description = "When it is set to true, the repository is automatically created when new images are pushed. If it is set to false, create a repository for the image before pushing."
  default     = false
}

variable "default_visibility" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["PUBLIC","PRIVATE"],
    "Default": "PUBLIC",
    "Label": "default_visibility",
    "Description" : "Default repository visibility in this namespace."
  }
  EOT
}

variable "repo_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["PUBLIC","PRIVATE"],
    "Default": "PUBLIC",
    "Label": "repo_type",
    "Description" : "repo type"
  }
  EOT
}

variable "summary" {
  type        = string
  description = "Repository General information"
  default     = ""
}

variable "repo_name" {
  type        = string
  description = "The name of the container registry repository."
  default     = ""
}

variable "detail" {
  type        = string
  description = "Storage Library-specific information"
  default     = ""
}
