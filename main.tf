# Titan Environment Module

locals {
  env_tags = {
    titan_env = var.name
    titan_env_short = var.name_short
    titan_env_fancy = var.name_fancy
  }

  hub_tags = {
    titan_hub = var.hub_name
    titan_hub_zone = var.hub_zone
  }
}

module "network" {
  source  = "naftulikay/titan-network/aws"
  version = "~> 2.1.0"

  domain = var.domain
  domain_name_servers = var.domain_name_servers
  instance_tenancy = var.instance_tenancy
  name = var.name
  name_fancy = var.name_fancy
  name_short = var.name_short
  nat_enabled = var.nat_enabled
  netbios_name_servers = var.netbios_name_servers
  network_id = var.network_id
  ntp_servers = var.ntp_servers
  subnets_per_layer = var.subnets_per_layer

  addtl_tags = merge(local.env_tags, local.hub_tags, var.addtl_tags)
}
