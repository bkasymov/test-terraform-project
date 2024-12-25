variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. production, staging)"
  type        = string
}

variable "cluster_id" {
  description = "ID of the Kubernetes cluster"
  type        = string
}

variable "extnet_name" {
  description = "Name of the external network"
  type        = string
  default     = "ext-net"
}

variable "registry_version" {
  description = "Version of the registry addon"
  type        = string
}

variable "registry_credentials" {
  description = "Credentials for container registry"
  type = object({
    username = string
    password = string
  })
  sensitive = true
}

variable "s3_credentials" {
  description = "Credentials for S3 storage"
  type = object({
    access_key = string
    secret_key = string
    bucket     = string
  })
  sensitive = true
} 