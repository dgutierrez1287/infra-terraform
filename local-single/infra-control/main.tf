locals {
  secret_store_name = "cluster-secret-store" 
  secret_store_type = "ClusterSecretStore"
  refresh_interval = "15s"
  secret_namespace = "infra"
}

resource "kubernetes_namespace" "infra_namespace" {
  metadata {
    name = "infra"
  }
}
