module "ingress-nginx" {
  source     = "./modules/helm"
  name       = "ingress-nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "ingress-nginx"
  helm_set = {
    "controller.metrics.enabled"                                             = "true"
    "controller.metrics.serviceMonitor.enabled"                              = "true"
    "controller.metrics.serviceMonitor.namespace"                            = "default"
    "controller.publishService.enabled"                                      = "true"
    "controller.service.type"                                                = "LoadBalancer"
  }
}
