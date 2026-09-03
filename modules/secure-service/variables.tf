variable "name" {
  type        = string
  description = "Service name"

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]*$", var.name))
    error_message = "Name must be lowercase alphanumeric with hyphens."
  }
}

variable "image" {
  type        = string
  description = "Container image, pinned to a specific tag"

  validation {
    condition     = !can(regex(":latest$", var.image))
    error_message = "Image must be pinned to a specific tag, not :latest."
  }
}

variable "internal_port" {
  type    = number
  default = 8080
}
# The guardrails live in this file — in the module's surface area.
# There is deliberately NO variable for making this public, so nobody
# can accidentally do it. The unsafe option doesn't exist to be chosen.
#
# The validation blocks reject bad input at plan time, before anything
# is created: names must match a pattern, and the image can't be :latest,
# because a moving tag means the thing you tested isn't the thing that ships.