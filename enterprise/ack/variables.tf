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
        "ZoneId": "$${zone_id}",
        "VpcId": "$${vpc_id}"
    },
    "Description": "Select a VSwitch ID.",
    "Label": "vswitchId"
  }
  EOT
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
  default     = 100
}

variable "group_cidr_ip" {
  type        = list(string)
  description = "The target IP address range. The default value is 0.0.0.0/0 (which means no restriction will be applied)."
  default     = ["10.0.0.0/8", "0.0.0.0/0"]
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

variable "instance_type" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::ECS::Instance::InstanceType",
    "AssociationPropertyMetadata": {
        "RegionId": "$${region_id}",
        "ZoneId": "$${zone_id}"
    }, 
    "Label": "ECS instance_type"
  }
  EOT
}

variable "kubernetes_name" {
  default = ""
}
variable "cluster_domain" {
  type        = string
  description = "Local domain name of the cluster"
  default     = "cluster.local"
}

variable "cluster_spec" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["ack.standard","ack.pro.small"],
    "Default": "ack.pro.small",
    "Label": "ACK cluster_spec",
    "Description" : "Kubernetes the cluster specification of the cluster. Ack. standard: Standard managed cluster. Ack. pro. Small: professionally managed clusters."
  }
  EOT
}

variable "cpu_policy" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["static","none"],
    "Default": "none",
    "Label": "cpu policy",
    "Description" : "Kubelet cpu policy。"
  }
  EOT
}

variable "deletion_protection" {
  type        = bool
  description = "Do I enable cluster deletion protection。"
  default     = false
}
variable "enable_ssh" {
  type        = bool
  description = "Do you want to log on to the node through SSH"
  default     = false
}
variable "is_enterprise_security_group" {
  type        = bool
  description = "Is it enabled to create an advanced security group"
  default     = false
}
variable "install_cloud_monitor" {
  type        = bool
  description = "Install CloudMonitor Agent on ECS"
  default     = true
}
variable "new_nat_gateway" {
  type        = bool
  description = "Whether to create a new NAT gateway when creating a Kubernetes cluster."
  default     = true
}
variable "slb_internet_enabled" {
  type        = bool
  description = "Whether to create a Internet load balancer for API Server."
  default     = true
}

variable "node_cidr_mask" {
  type        = string
  description = "The node CIDR block specifies the number of pods that can run on a single node. 24-28 is permitted. 24 means 2 ^(32-24)-1=255, a node can run up to 255 pods"
  default     = "24"
}
variable "node_port_range" {
  type        = string
  description = "Service port range for the node, valid values: 30000 to 65535"
  default     = "30000-32767"
}

variable "os_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["Linux","Windows"],
    "Default": "Linux",
    "Label": "os_type",
    "Description" : "The operating system of the node that runs the pod"
  }
  EOT
}
variable "platform" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["CentOS","AliyunLinux"],
    "Default": "CentOS",
    "Label": "platform",
    "Description" : "The architecture of the node running the pod"
  }
  EOT
}

variable "pod_cidr" {
  type        = string
  description = "CIDR block for pod network when using Flannel"
  default     = ""
}

variable "proxy_mode" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["ipvs","iptables"],
    "Default": "ipvs",
    "Label": "proxy_mode",
    "Description" : "Options kube-proxy in the proxy mode."
  }
  EOT
}

variable "service_cidr" {
  type        = string
  description = "The CIDR block of the service network. It cannot be duplicated with the CIDR of the VPC and the CIDR used by the Kubernetes cluster in the VPC, and cannot be modified after creation."
  default     = ""
}

variable "worker_disk_category" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["cloud","cloud_ssd","cloud_essd","cloud_efficiency"],
    "Default": "cloud_efficiency",
    "Label": "worker_disk_category",
    "Description" : "The system disk category of the working node."
  }
  EOT
}

variable "worker_disk_size" {
  type        = number
  description = "The size of the system disk of the working node. The valid value range is [40-500] in GB."
  default     = 40
}
variable "worker_instance_charge_type" {
  type        = string
  description = <<EOT
  {
    "AllowedValues":["PostPaid","PrePaid"],
    "Default": "PostPaid",
    "Label": "worker_instance_charge_type",
    "Description": "Payment type"
  }
  EOT
}
variable "worker_number" {
  type        = number
  description = "Number of worker nodes in a Kubernetes cluster"
  default     = 2
}

variable "runtime_name" {
  type        = string
  description = <<EOT
  {
   "AllowedValues": ["Docker","containerd","Sandboxed-Container"],
   "Default": "Docker",
   "Label": "runtime_name",
   "Description": "The runtime of the container."
  }
  EOT
}

variable "runtime_version" {
  type        = string
  description = "The version of the running container."
  default     = ""
}

variable "password" {
  default = ""
}

variable "load_balancer_spec" {
  type        = string
  description = <<EOT
  {
    "AssociationProperty": "ALIYUN::SLB::Instance::InstanceType",
    "AssociationPropertyMetadata": {
        "RegionId": "$${region_id}",
        "ZoneId": "$${kubernetes_ZoneId}"
    }, 
    "Label": "load_balancer_spec"
  }
  EOT
}

variable "group_name" {
  default = ""
}
