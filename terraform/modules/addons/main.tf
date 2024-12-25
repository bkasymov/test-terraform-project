module "nginx_ingress" {
  source = "./nginx"

  cluster_id = var.cluster_id
}

module "registry" {
  source = "./registry"
  
  cluster_id = var.cluster_id
  cluster_name = var.cluster_name
  registry_credentials = var.registry_credentials
  registry_version = var.registry_version
  s3_credentials = var.s3_credentials
}

# Wait for nginx-ingress to be ready
resource "null_resource" "wait_for_nginx" {
  depends_on = [module.nginx_ingress]
}

module "cert_manager" {
  source = "./cert-manager"
  
  cluster_id = var.cluster_id

  # Use the null_resource to create dependency
  depends_on = [null_resource.wait_for_nginx]
}
