variable "cluster_id" {
  type        = string
  description = "ID of the Kubernetes cluster"
}

variable "cluster_name" {
  type        = string
  description = "Name of the Kubernetes cluster"
}

variable "extnet_name" {
  type        = string
  description = "Name of the external network"
  default     = "internet"
}

variable "registry_version" {
  type        = string
  description = "Version of the Docker Registry addon"
  default     = "2.2.2"
}

variable "registry_credentials" {
  type = object({
    username = string
    password = string
  })
  description = "Credentials for Docker Registry authentication"
  sensitive   = true
}

variable "s3_credentials" {
  type = object({
    access_key = string
    secret_key = string
    bucket     = string
  })
  description = "Credentials for S3 storage"
  sensitive   = true
} 