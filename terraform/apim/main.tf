terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.6.0"
    }
  }
}

module "app_geolocation_api" {
  source = "./modules/apis/geolocation"
}

module "app_client_externalApp01" {
  source         = "./modules/clients/externalApp01"
  app_details = module.app_geolocation_api.app_details
}