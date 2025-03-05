data "azuread_client_config" "current" {}

data "azuread_administrative_unit" "au" {
  count        = var.administrative_unit_name != null ? 1 : 0
  display_name = var.administrative_unit_name
}

data "azuread_user" "owners" {
  for_each            = var.team_owners != null ? toset(var.team_owners) : toset([])
  user_principal_name = each.value
}

data "azuread_user" "members" {
  for_each            = var.members != null ? toset(var.members) : toset([])
  user_principal_name = each.value
}

data "azuread_application" "app" {
  count        = var.enterprise_application_name != null ? 1 : 0
  display_name = var.enterprise_application_name
}

data "azuread_service_principal" "sp" {
  count    = var.enterprise_application_name != null ? 1 : 0
  client_id = data.azuread_application.app[0].client_id
}
