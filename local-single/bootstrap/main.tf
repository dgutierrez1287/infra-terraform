locals {
  cluster_name = "main"
  env = "local"
  cluster_api_port = "6443"

  vault_address = "https://vault.single-node.test"
  internal_vault_address = "http://vault.vault.svc.cluster.local:8200"
  skip_vault_tls = true
  vault_secrets_path = "secrets"
  env_cacert_kube_secret = "local-ca-cert"
  env_cacert_secret_key = "ca_cert"
  env_cacert_secret_namespace = "kube-system"

  max_secret_versions = 5
  delete_version_after = 0
  cas_required = false
}

## Vault Secrets paths ##
resource "vault_mount" "secrets_kv_v2" {
  path = "secrets"
  type = "kv"
  options = { 
    version = "2" 
  }
  description = "Main secrets KV"
}

resource "vault_kv_secret_backend_v2" "secrets_kv_backend" {
  mount = vault_mount.secrets_kv_v2.path
  max_versions = local.max_secret_versions
  delete_version_after = local.delete_version_after
  cas_required = local.cas_required
}

## base kubernetes cluster setup ##
module "main-kubernetes-cluster-bootstrap" {
  source = "../../terraform-modules/kube_cluster_bootstrap"

  cluster_name = local.cluster_name
  env = local.env
  cluster_api_port = local.cluster_api_port

  vault_address = local.vault_address
  internal_vault_address = local.internal_vault_address
  skip_vault_tls = local.skip_vault_tls
  vault_connection_type = "internal"
  vault_secrets_path = local.vault_secrets_path
  env_cacert_kube_secret = local.env_cacert_kube_secret
  env_cacert_secret_key = local.env_cacert_secret_key
  env_cacert_secret_namespace = local.env_cacert_secret_namespace

  local_dns_config = var.local_dns_config
  cluster_ca_cert = var.cluster_ca_cert
  cluster_vip = var.cluster_vip

  providers = {
    kubernetes = kubernetes.local-single-node
  }
}

