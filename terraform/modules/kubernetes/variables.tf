variable "network_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "master_flavor" {
  type = string
}

variable "node_group_flavor" {
  type = string
}

variable "master_count" {
  type = number
}

variable "node_count" {
  type = number
}

variable "availability_zone" {
  type = string
}

variable "floating_ip_enabled" {
  type = bool
}

variable "min_nodes" {
  type = number
}

variable "max_nodes" {
  type = number
}

variable "cluster_type" {
  type = string
}

variable "disk_type" {
  type = string
}

variable "environment" {
  type = string
}

variable "virtual_disks" {
  description = "List of virtual disks for the Kubernetes cluster"
  type        = list(object({
    name              = string
    description       = string
    size              = number
    metadata          = optional(map(string))
    availability_zone = string
    volume_type       = string
  }))
}