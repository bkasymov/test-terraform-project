variable "buckets" {
  description = "List of bucket configurations"
  type        = list(object({
    name = string
  }))
}