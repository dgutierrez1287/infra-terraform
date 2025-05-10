#-------------------------------
# locals
#-------------------------------

#--------------------------------
# Provider Versions
#-------------------------------
terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.35.1"
    }
    vault = {
      source = "hashicorp/vault"
      version = "~> 4.6.0"
    }
  }
}

#--------------------------------
# Provider Configuration
#-------------------------------
provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = var.kube_context
  alias = "local-single-node"
}

provider "vault" {
  address = local.vault_address
  token = var.vault_token
  skip_tls_verify = local.skip_vault_tls
}
