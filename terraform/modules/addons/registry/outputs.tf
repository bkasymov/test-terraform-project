output "registry_url" {
  description = "Docker Registry URL"
  value       = "${vkcs_networking_floatingip.registry_fip.address}:5000"
}

output "registry_credentials" {
  description = "Docker Registry credentials"
  value = {
    username = var.registry_credentials.username
    password = var.registry_credentials.password
  }
#   sensitive = true
} 

output "s3_credentials" {
  description = "S3 credentials"
  value       = var.s3_credentials
}