# SS.Helm.Module
```bash
module "ingress-nginx" {
  source     = "git@github.com:sportingsolutions/SS.Terraform.Module.Helm.git"
  depends_on = [module.gke-spoke-sandbox-dev.node_pools]
  chart      = "ingress-nginx"
  name       = "ingress-nginx"
  namespace  = "ingress-nginx"
  repository = format("https://%s@raw.githubusercontent.com/sportingsolutions/SS.Helm.Charts/master/charts/", data.vault_generic_secret.github-token.data.value)
  values = [templatefile("./values.yaml")]
  helm_set = {
    "controller.service.annotations.cloud\\.google\\.com/load-balancer-type" = "Internal",
    "controller.service.type"                                                = "LoadBalancer"
  }
}
```
