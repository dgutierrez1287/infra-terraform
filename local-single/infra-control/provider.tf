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
  }
}

#--------------------------------
# Provider Configuration
#-------------------------------
provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = var.kube_context
}


