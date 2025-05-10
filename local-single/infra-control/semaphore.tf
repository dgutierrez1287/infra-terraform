module "semaphore-admin-user-secret" {
  source = "../../terraform-modules/kube_external_secret"

  secret_name = "semaphore-admin-user"
  secret_namespace = local.secret_namespace
  refresh_interval = local.refresh_interval
  secret_store_name = local.secret_store_name
  secret_store_type = local.secret_store_type
  vault_key = "/secrets/data/infra/semaphore/admin-user"

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

module "semaphore-db-user-secret" {
  source = "../../terraform-modules/kube_external_secret"

  secret_name = "semaphore-db-user"
  secret_namespace = local.secret_namespace
  refresh_interval = local.refresh_interval
  secret_store_name = local.secret_store_name
  secret_store_type = local.secret_store_type
  vault_key = "/secrets/data/infra/semaphore/db-user"
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

module "semaphore-encryption-key-secret" {
  source = "../../terraform-modules/kube_external_secret"
  
  secret_name = "semaphore-encryption-key"
  secret_namespace = local.secret_namespace
  refresh_interval = local.refresh_interval
  secret_store_name = local.secret_store_name
  secret_store_type = local.secret_store_type
  vault_key = "/secrets/data/infra/semaphore/encryption-key"

  secret_props = [
    {
      secret_key = "encryptionKey"
      property = "encryptionKey"
    }
  ]
}
