variable "group_name" {
  default = ""
}

variable "group_tcp_port" {
  type        = list(string)
  description = "The initial open port of the default security group of the VPC"
  default     = ["22/22", "3389/3389"]
}

variable "group_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["ingress","egress"],
    "Default": "ingress",
    "Label": "group_type",
    "Description" : "The type of rule being created. Valid options are ingress (inbound) or egress (outbound)."
  }
  EOT
}

variable "group_ip_protocol" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["tcp","udp","icmp","gre","all"],
    "Default": "tcp",
    "Label": "ip_protocol",
    "Description" : "The protocol. Can be tcp, udp, icmp, gre or all."
  }
  EOT
}

variable "group_nic_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["internet","intranet"],
    "Default": "intranet",
    "Label": "Network type",
    "Description" : "Network type, can be either internet or intranet"
  }
  EOT
}

variable "group_policy" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["accept","drop"],
    "Default": "accept",
    "Label": "group_policy",
    "Description" : "Authorization policy, can be either accept or drop"
  }
  EOT
}

variable "group_priority" {
  type        = number
  description = "Authorization policy priority, with parameter values: 1-100."
  default     = 1
}

variable "group_cidr_ip" {
  type        = list(string)
  description = "The target IP address range. The default value is 0.0.0.0/0 (which means no restriction will be applied)."
  default     = ["10.0.0.0/8", "0.0.0.0/0"]
}

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

variable "VSwitchId" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::ECS::VSwitch::VSwitchId",
    "AssociationPropertyMetadata": {
        "RegionId": "$${region_id}",
        "ZoneId": "$${rds_ZoneId}",
        "VpcId": "$${vpc_id}"
    },
    "Description": "Select a VSwitch ID.",
    "Label": "vswitchId"
  }
  EOT
}

variable "rds_ZoneId" {
  type        = string
  description = <<EOT
  { 
    "AssociationProperty": "ALIYUN::ECS::ZoneId",
    "AssociationPropertyMetadata": {
        "RegionId": "$${region_id}",
        "VpcId": "$${vpc_id}"
    },
    "Label": "RDS zone"
  }
  EOT
}


variable "db_instance_type" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::RDS::Instance::InstanceType",
    "AssociationPropertyMetadata": {
      "RegionId": "$${region_id}",
      "ZoneId": "$${rds_ZoneId}",
      "Engine": "$${engine_id}",
      "EngineVersion": "$${EngineVersion}",
      "DBInstanceStorageType": "$${db_instance_storage_type}"
    },
    "Label": "RDS instance type"
  }
  EOT
}


variable "engine_id" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::RDS::Engine::EngineId",
    "Label": "RDS engine"
  }
  EOT
}

variable "EngineVersion" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::RDS::Engine::EngineVersion",
    "AssociationPropertyMetadata": {
        "Engine": "$${engine_id}"
    },
    "Label": "RDS Version"
  }
  EOT
}


variable "db_instance_storage_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["local_ssd","cloud_essd","cloud_essd2","cloud_essd3"],
    "Default": "local_ssd",
    "Label": "db_instance_storage_type",
    "Description" : "The storage type of the instance."
  }
  EOT
}

variable "db_instance_charge_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["Prepaid","Postpaid"],
    "Default": "Postpaid",
    "Label": "db_instance_charge_type",
    "Description" : "The billing method. Currently, this resource only supports PostPaid to PrePaid."
  }
  EOT
}

variable "db_storage" {
  type        = number
  description = "The user-defined storage space of the database instance. Valid values:[5, 2000] MySQL/PostgreSQL/PPAS HA dual-node version;[20,1000] MySQL 5.7 basic single-node version;[10, 2000] for SQL Server 2008R2;[20,2000] SQL Server 2012 Basic Single-Node Edition at a rate of 5 GB. For more information, see Instance type tables. Note: The SQL Server instance has an additional 5 GB of storage space and it is not in the specified instance_storage."
  default     = 30
}

variable "rds_name" {
  default = ""
}

variable "monitoring_period" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["5","60","300"],
    "Default": "300",
    "Label": "monitoring_period",
    "Description" : "The monitoring frequency in seconds."
  }
  EOT
}
