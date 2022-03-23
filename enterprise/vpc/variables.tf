variable "vpc_cidr_block" {
  type        = string
  description = "We recommend that you use the RFC private IP address as the CIP segment of the VPC, such as 10.0.0.0/8,172.16.0.0/12,192.168.0.0/16."
  default     = "10.0.0.0/8"
}

variable "vpc_name" {
  default = "tf_test_foo"
}

