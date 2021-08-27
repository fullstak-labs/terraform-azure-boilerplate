terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.6.0"
    }
  }
}

module "app_geolocation_api" {
  source = "./apps/backendApps/geolocation"
}

module "app_client_externalApp01" {
  source         = "./apps/clientApps/externalApp01"
  app_details = module.app_geolocation_api.app_details
}