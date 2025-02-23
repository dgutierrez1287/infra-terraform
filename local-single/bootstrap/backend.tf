terraform {
  backend "s3" {
    bucket = "terraform-state"
    endpoints = {
      s3 = "http://minio.single-node.test"
    }
    key = "base.tfstate"
    
    access_key = "admin"
    secret_key = "admin123"

    region = "main"
    skip_credentials_validation = true
    skip_requesting_account_id = true
    skip_metadata_api_check = true
    skip_region_validation = true
    use_path_style = true
  }
}
