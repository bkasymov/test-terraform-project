resource "vkcs_kubernetes_addon" "nginx_ingress" {
  cluster_id = var.cluster_id
  addon_id   = data.vkcs_kubernetes_addon.nginx_ingress.id
  namespace  = "nginx-ingress"

  configuration_values = jsonencode({
    controller = {
      service = {
        type = "LoadBalancer"
        loadBalancerIP = vkcs_networking_floatingip.nginx_ingress_fip.address
        annotations = {
          "loadbalancer.openstack.org/health-monitor-delay": "5s"
          "loadbalancer.openstack.org/health-monitor-max-retries": "3"
          "loadbalancer.openstack.org/health-monitor-timeout": "5s"
          "loadbalancer.openstack.org/keep-floatingip": "true"
        }
      }
      config = {
        use-forwarded-headers = "true"
        compute-full-forwarded-for = "true"
        use-proxy-protocol = "false"
        enable-real-ip = "true"
        proxy-real-ip-cidr = "0.0.0.0/0"
      }
      metrics = {
        enabled = true
      }
      publishService = {
        enabled = true
      }
    }
  })

  depends_on = [
    vkcs_networking_floatingip.nginx_ingress_fip
  ]
} 