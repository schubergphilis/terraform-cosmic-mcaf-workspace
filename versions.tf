terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.25.0"
    }
  }
  required_version = ">= 0.13"
}
