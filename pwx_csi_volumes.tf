terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.50"
    }
    nomad = {
      source  = "hashicorp/nomad"
      version = "~> 1"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4"
    }
  }
  required_version = ">= 1.0"
}

provider "nomad" {
  address   = "https://nomad.dev.net:4646"
  secret_id = "secret-id"
  region    = "aws-us-east-1"
}

data "nomad_volumes" "example" {
  type      = "csi"
  plugin_id = "portworx"
}

output "inspected_volumes" {
  value = data.nomad_volumes.example.volumes
}
