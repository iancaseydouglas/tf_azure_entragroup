# Azure AD Group Terraform Module

## Overview
This Terraform module creates an Azure AD security group with flexible configuration options, including:
- Group naming
- Team type specification
- Administrative unit assignment
- Group owners and members
- Enterprise application role assignment

## Prerequisites
- Terraform >= 1.3.0
- AzureAD Provider >= 2.30.0

## Variables

| Name | Type | Description | Default | Required |
|------|------|-------------|---------|:--------:|
| `team_name` | `string` | Name of the team | - | ✓ |
| `project_name` | `string` | Name of the project | `null` | ✗ |
| `team_type` | `string` | Type of team ('maintainer', 'rw', or 'r') | `"maintainer"` | ✗ |
| `description` | `string` | Description of the group | `""` | ✗ |
| `administrative_unit_name` | `string` | Display name of administrative unit to assign the group | `null` | ✗ |
| `administrative_unit_ids` | `list(string)` | List of administrative unit IDs | `null` | ✗ |
| `team_owners` | `list(string)` | List of user principal names to add as owners | `null` | ✗ |
| `members` | `list(string)` | List of user principal names to add as members | `null` | ✗ |
| `enterprise_application_name` | `string` | Name of enterprise application for SCIM provisioning | `null` | ✗ |
| `member_type` | `string` | Type of member for app role assignment ('Restricted User' or 'User') | `"Restricted User"` | ✗ |

## Outputs
- `id`: Object ID of the created group
- `name`: Display name of the group
- `object_id`: Object ID of the group
- `display_name`: Display name of the group

## Example Usage
```hcl
module "team_group" {
  source = "./path/to/module"

  team_name        = "team-bravo"
  project_name     = "idp-guardrails"
  team_type        = "rw"
  description      = "Team Bravo"
  team_owners      = ["owner1@amplexample.com"]
  members          = ["member1@amplexample.com", "member2@amplexample.com"]
}
```

## Notes
- The module automatically adds the current client as a group owner
- Supports optional administrative unit and enterprise application assignments