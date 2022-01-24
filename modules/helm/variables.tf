variable "atomic" {
  type    = string
  default = true
}
variable "chart" {}
variable "create_namespace" {
  type    = string
  default = "false"
}
variable "force_update" {
  type    = string
  default = "false"
}
variable "helm_set" {
  type    = map(string)
  default = {}
}
variable "name" {}
variable "namespace" {
  type    = string
  default = "default"
}
variable "repository" {}
variable "values" {
  type    = list(string)
  default = []
}
variable "skip_crds" {
  type    = string
  default = "false"
}
variable "chart_version" {
  type    = string
  default = null
}
