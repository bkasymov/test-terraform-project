variable "cluster_id" {
  type        = string
  description = "ID of the Kubernetes cluster"
}

variable "extnet_name" {
  type        = string
  description = "Name of the external network"
  default     = "internet"
} 