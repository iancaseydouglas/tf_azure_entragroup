output "id" {
  value       = azuread_group.this.id
  description = "The object ID of the group."
}

output "name" {
  value       = azuread_group.this.display_name
  description = "The display name of the group."
}

output "object_id" {
  value       = azuread_group.this.id
  description = "The object ID of the group."
}

output "display_name" {
  value       = azuread_group.this.display_name
  description = "The display name of the group."
}