data "alicloud_caller_identity" "current" {
}

resource "alicloud_ram_role" "default" {
  name        = var.role_name
  document    = <<EOF
  {
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "RAM": [
            "acs:ram::${data.alicloud_caller_identity.current.account_id}:root"
          ]
        }
      }
    ],
    "Version": "1"
  }
  EOF
  description = "created by terraform"
  force       = true
}

output "role_arn" {
  value = alicloud_ram_role.default.arn
  description = "The role arn."
}

output "document" {
  value = alicloud_ram_role.default.document
  description = "Authorization strategy of the role."
}