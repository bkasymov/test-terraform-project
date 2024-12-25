terraform {
  source = "."
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  required_providers {
    vkcs = {
      source  = "vk-cs/vkcs"
      version = "~> 0.8"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.16"
    }
    null = {
      source = "hashicorp/null"
    }
  }
}



provider "vkcs" {
  username   = var.vkcs_username
  password   = var.vkcs_password
  project_id = var.vkcs_project_id
}

provider "aws" {
  region                      = "ru-msk"
  access_key                  = var.aws_access_key
  secret_key                  = var.aws_secret_key
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  skip_region_validation      = true
  endpoints {
    s3 = "https://hb.ru-msk.vkcloud-storage.ru"
  }
}

terraform {
  backend "s3" {
    bucket = "tabler-terraform-state"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region = "ru-msk"
    access_key = "${get_env("TF_VAR_aws_access_key")}"
    secret_key = "${get_env("TF_VAR_aws_secret_key")}"
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_requesting_account_id = true
    skip_region_validation = true
    skip_s3_checksum = true
    endpoints = {
      s3 = "https://hb.ru-msk.vkcloud-storage.ru"
    }
  }
}

variable "vkcs_username" {
  type = string
}
variable "vkcs_password" {
  type = string
}
variable "vkcs_project_id" {
  type = string
}
variable "aws_access_key" {
  type = string
}
variable "aws_secret_key" {
  type = string
}
EOF
}