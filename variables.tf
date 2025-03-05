variable "team_name" {
  type        = string
  description = "(Required) Name of the team."
}

variable "project_name" {
  type        = string
  description = "(Optional) Name of the project."
  default     = null
}

variable "team_type" {
  type        = string
  description = "(Optional) Type of the team. Must be 'maintainer', 'rw' (Read-Write), or 'r' (Read)."
  default     = "maintainer"
  validation {
    condition     = contains(["maintainer", "rw", "r"], var.team_type)
    error_message = "Team type must be one of: 'maintainer', 'rw', 'r'"
  }
}

variable "description" {
  type        = string
  description = "(Optional) Description of the group."
  default     = ""
}

variable "administrative_unit_name" {
  type        = string
  description = "(Optional) Display name of the administrative unit to assign the group to."
  default     = null
}

variable "administrative_unit_ids" {
  type        = list(string)
  description = "(Optional) List of administrative unit IDs to assign the group to. Takes precedence over
administrative_unit_name if both are provided."
  default     = null
}

variable "team_owners" {
  type        = list(string)
  description = "(Optional) List of user principal names to add as owners."
  default     = null
}

variable "members" {
  type        = list(string)
  description = "(Optional) List of user principal names to add as members."
  default     = null
}

variable "enterprise_application_name" {
  type        = string
  description = "(Optional) Name of the enterprise application for SCIM provisioning."
  default     = null
}

variable "member_type" {
  type        = string
  description = "(Optional) Type of member for the app role assignment. Must be 'Restricted User' or 'User'."
  default     = "Restricted User"
  validation {
    condition     = contains(["Restricted User", "User"], var.member_type)
    error_message = "Member type must be one of: 'Restricted User', 'User'"
  }
}