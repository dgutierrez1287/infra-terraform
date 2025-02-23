variable "local_dns_config" {
  description = "The configuration for local DNS"
  type = map(object({
    name = string
    dns_server1 = string
    dns_server2 = string
  }))
}

variable "cluster_ca_cert" {
  description = "The CA certificate for the cluster"
  type = string
}

variable "cluster_vip" {
  description = "The vip for the kubernetes cluster"
  type = string
}

variable "kube_context" {
  description = "The kubernetes context to use"
  type = string
}

variable "vault_token" {
  description = "The vault token to use for access"
  type = string
}
