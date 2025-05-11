module "netbox-db-user-secret" {
  source = "../../terraform-modules/kube_external_secret"

  secret_name = "netbox-db-user"
  secret_namespace = local.secret_namespace
  refresh_interval = local.refresh_interval
  secret_store_name = local.secret_store_name
  secret_store_type = local.secret_store_type
  vault_key = "/secrets/data/infra/netbox/db-user"
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

module "netbox-admin-user-secret" {
  source = "../../terraform-modules/kube_external_secret"

  secret_name = "netbox-admin-user"
  secret_namespace = local.secret_namespace
  refresh_interval = local.refresh_interval
  secret_store_name = local.secret_store_name
  secret_store_type = local.secret_store_type
  vault_key = "/secrets/data/infra/netbox/admin-user"

  secret_props = [
    {
      secret_key = "username"
      property = "username"
    },
    {
      secret_key = "password"
      property = "password"
    },
    {
      secret_key = "email"
      property = "email"
    }
  ]
}

module "netbox-secret-key" {
  source = "../../terraform-modules/kube_external_secret"

  secret_name = "netbox-secret-key"
  secret_namespace = local.secret_namespace
  refresh_interval = local.refresh_interval
  secret_store_name = local.secret_store_name
  secret_store_type = local.secret_store_type
  vault_key = "/secrets/data/infra/netbox/secret-key"

  secret_props = [
    {
      secret_key = "secretKey"
      property = "secretKey"
    }
  ]
}
