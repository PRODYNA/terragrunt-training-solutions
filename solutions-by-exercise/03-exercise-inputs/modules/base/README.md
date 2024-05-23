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
| [azurerm_application_security_group.web](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_security_group) | resource |
| [azurerm_network_security_group.web](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.http](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.ssh](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_private_dns_zone.mysql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.mysql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_subnet.db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_subnet_cidr"></a> [db\_subnet\_cidr](#input\_db\_subnet\_cidr) | CIDR of db subnet | `string` | n/a | yes |
| <a name="input_default_subnet_cidr"></a> [default\_subnet\_cidr](#input\_default\_subnet\_cidr) | CIDR of default subnet | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to use | `string` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Prefix for the azure resources | `string` | `"dev"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | ID of subscription to deploy to | `string` | n/a | yes |
| <a name="input_vnet_cidr"></a> [vnet\_cidr](#input\_vnet\_cidr) | CIDR of VNet | `string` | n/a | yes |
| <a name="input_wordpress_instances"></a> [wordpress\_instances](#input\_wordpress\_instances) | List of Wordpress Instances | `list(string)` | <pre>[<br>  "i1"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asg_id"></a> [asg\_id](#output\_asg\_id) | n/a |
| <a name="output_db_subnet_id"></a> [db\_subnet\_id](#output\_db\_subnet\_id) | n/a |
| <a name="output_default_subnet_id"></a> [default\_subnet\_id](#output\_default\_subnet\_id) | n/a |
| <a name="output_pip_ids"></a> [pip\_ids](#output\_pip\_ids) | n/a |
| <a name="output_private_dns_zone_id"></a> [private\_dns\_zone\_id](#output\_private\_dns\_zone\_id) | n/a |
<!-- END_TF_DOCS -->