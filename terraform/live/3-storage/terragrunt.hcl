include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/storage"
}

inputs = {
  buckets = [
    {
      name = "test-bucket"
    },
    {
      name = "test-bucket-2"
    },
  ]
}