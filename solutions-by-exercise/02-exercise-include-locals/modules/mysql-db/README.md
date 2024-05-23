<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mysql_flexible_server.mysql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server) | resource |
| [azurerm_mysql_flexible_server_configuration.require_secure_transport](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server_configuration) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | How long to keep backups in days | `number` | `7` | no |
| <a name="input_db_pw"></a> [db\_pw](#input\_db\_pw) | Username for the DB | `string` | n/a | yes |
| <a name="input_db_sku_name"></a> [db\_sku\_name](#input\_db\_sku\_name) | Name of the SKU to use for the MySQL | `string` | `"B_Standard_B1ms"` | no |
| <a name="input_db_subnet_id"></a> [db\_subnet\_id](#input\_db\_subnet\_id) | Id of the subnet where to deploy the DB | `string` | n/a | yes |
| <a name="input_db_user"></a> [db\_user](#input\_db\_user) | Password for the DB | `string` | n/a | yes |
| <a name="input_mysql_name"></a> [mysql\_name](#input\_mysql\_name) | Name of the MySQL | `string` | n/a | yes |
| <a name="input_mysql_zone"></a> [mysql\_zone](#input\_mysql\_zone) | Zone where to deploy, can be 1,2 or 3 | `number` | `2` | no |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | Id of the private dns zone to use for the DB | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to use | `string` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Prefix for the azure resources | `string` | `"dev"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | ID of subscription to deploy to | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_url"></a> [db\_url](#output\_db\_url) | n/a |
<!-- END_TF_DOCS -->