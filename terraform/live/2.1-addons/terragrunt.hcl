include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/addons"
}

dependency "kubernetes" {
  config_path = "../2-kubernetes"
}

dependency "networking" {
  config_path = "../1-networking"
}

inputs = {
  cluster_name = "test-project-vkcs"
  environment  = "dev"

  cluster_id = dependency.kubernetes.outputs.cluster_id
  extnet_name = "internet"

  # Registry configuration
  registry_version = "2.2.2"

  registry_credentials = {
    username = get_env("TF_VAR_registry_username")
    password = get_env("TF_VAR_registry_password")
  }

  s3_credentials = {
    access_key = get_env("TF_VAR_registry_access_key")
    secret_key = get_env("TF_VAR_registry_secret_key")
    bucket     = "test-project-vkcs"
  }
}
