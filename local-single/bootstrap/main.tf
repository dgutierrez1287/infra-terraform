locals {
  cluster_name = "main"
  env = "local"
  cluster_api_port = "6443"
  cas_required = false
}

module "vault-bootstrap" {
  source = "../../terraform-modules/vault_bootstrap"

  env = local.env
  cas_required = local.cas_required
}

module "main-kubernetes-cluster-bootstrap" {
  source = "../../terraform-modules/kube_cluster_bootstrap"

  cluster_name = local.cluster_name
  env = local.env
  cluster_api_port = local.cluster_api_port

  local_dns_config = var.local_dns_config
  cluster_ca_cert = var.cluster_ca_cert
  cluster_vip = var.cluster_vip

  providers = {
    kubernetes = kubernetes.local-single-node
  }
}
