
locals {
  display_name = join("-", compact([var.team_name, var.project_name, var.team_type]))

  # Build administrative_unit_ids list - either from direct IDs, display name lookup, or empty
  administrative_unit_ids = var.administrative_unit_ids != null ? var.administrative_unit_ids : (
    var.administrative_unit_name != null ? [data.azuread_administrative_unit.au[0].id] : []
  )
}

locals {
  owners = distinct(concat(
    [data.azuread_client_config.current.object_id],
    [for owner in data.azuread_user.owners : owner.object_id]
  ))
}