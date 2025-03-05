
resource "azuread_group" "this" {
  display_name           = local.display_name
  description            = var.description
  security_enabled       = true
  owners                 = local.owners
  administrative_unit_ids = local.administrative_unit_ids
}

resource "azuread_group_member" "members" {
  for_each         = data.azuread_user.members
  group_object_id  = azuread_group.this.id
  member_object_id = each.value.object_id
}

resource "azuread_app_role_assignment" "role" {
  count               = var.enterprise_application_name != null && var.member_type != null ? 1 : 0
  app_role_id         = [for role in data.azuread_application.app[0].app_roles : role.id if role.display_name ==
var.member_type][0]
  principal_object_id = azuread_group.this.id
  resource_object_id  = data.azuread_service_principal.sp[0].object_id
}
