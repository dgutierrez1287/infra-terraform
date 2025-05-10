module "infra-db-superuser-secret" {
  source = "../../terraform-modules/kube_external_secret"

  secret_name = "infra-db-superuser"
  secret_namespace = local.secret_namespace
  refresh_interval = local.refresh_interval
  secret_store_name = local.secret_store_name
  secret_store_type = local.secret_store_type
  vault_key = "/secrets/data/infra/db-superuser"
  secret_type = "kubernetes.io/basic-auth"

  secret_props = [
    {
      secret_key = "username"
      property = "username"
    },
    {
      secret_key = "password"
      property = "password"
    }
  ]
}
