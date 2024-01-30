variable "bucket_name" {
  description = "Give a string separated with hiphens only"
  type = string
}

variable "bucket_tag" {
  description = "Tag for the bucket!"
  type = string
}

variable "versioning_enabled" {
  description = "true to enable it and false to disable it"
  type = bool
  # default = false
}

variable "acl_access" {
  description = "true for private ACL, false for public ACL"
  type = bool
  # default = false
}
