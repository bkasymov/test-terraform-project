resource "vkcs_kubernetes_addon" "docker_registry" {
  cluster_id = var.cluster_id
  addon_id   = data.vkcs_kubernetes_addon.registry.id
  namespace  = "registry"

  configuration_values = jsonencode({
    image = {
      repository = "registry"
      tag        = "2"
      pullPolicy = "IfNotPresent"
    }
    service = {
      name           = "registry"
      type           = "LoadBalancer"
      loadBalancerIP = vkcs_networking_floatingip.registry_fip.address
    }
    secrets = {
      htpasswd = "${var.registry_credentials.username}:${var.registry_credentials.password}"
      s3 = {
        accessKey = var.s3_credentials.access_key
        secretKey = var.s3_credentials.secret_key
      }
    }
    storage = "s3"
    s3 = {
      region         = "ru-msk"
      regionEndpoint = "https://hb.ru-msk.vkcs.cloud"
      bucket         = var.s3_credentials.bucket
      rootdirectory  = "/registry"
      secure         = true
      encrypt        = false
      v4auth         = true
    }
  })

  depends_on = [
    data.vkcs_kubernetes_cluster.cluster,
    vkcs_networking_floatingip.registry_fip
  ]

  lifecycle {
    create_before_destroy = false
    replace_triggered_by = [
      vkcs_networking_floatingip.registry_fip
    ]
  }
} 