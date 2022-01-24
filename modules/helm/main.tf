resource "helm_release" "helm-release" {
  atomic           = var.atomic
  chart            = var.chart
  version          = var.chart_version
  create_namespace = var.create_namespace
  force_update     = var.force_update
  name             = var.name
  namespace        = var.namespace
  skip_crds        = var.skip_crds
  values           = var.values
  repository       = var.repository
  dynamic "set" {
    iterator = set
    for_each = var.helm_set == null ? {} : var.helm_set
    content {
      name  = set.key
      value = set.value
    }
  }
}
