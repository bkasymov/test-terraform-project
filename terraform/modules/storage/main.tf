locals {
  bucket_map = { for bucket in var.buckets : bucket.name => bucket }
}

resource "aws_s3_bucket" "storage" {
  for_each = local.bucket_map
  bucket = each.value.name
  force_destroy = true
}