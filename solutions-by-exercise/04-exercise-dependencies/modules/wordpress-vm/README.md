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
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_application_security_group_association.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_application_security_group_association) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asg_id"></a> [asg\_id](#input\_asg\_id) | ID of ASG | `string` | n/a | yes |
| <a name="input_db_pw"></a> [db\_pw](#input\_db\_pw) | Username for the DB | `string` | n/a | yes |
| <a name="input_db_url"></a> [db\_url](#input\_db\_url) | Url to the mysql database | `string` | n/a | yes |
| <a name="input_db_user"></a> [db\_user](#input\_db\_user) | Password for the DB | `string` | n/a | yes |
| <a name="input_instances"></a> [instances](#input\_instances) | List of Wordpress Instances | `list(string)` | <pre>[<br>  "i1"<br>]</pre> | no |
| <a name="input_pip_ids"></a> [pip\_ids](#input\_pip\_ids) | IDs of public IPs | `list(string)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to use | `string` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Prefix for the azure resources | `string` | `"dev"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID of subnet | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | ID of subscription to deploy to | `string` | n/a | yes |
| <a name="input_vm_pw"></a> [vm\_pw](#input\_vm\_pw) | Username for the DB | `string` | n/a | yes |
| <a name="input_vm_user"></a> [vm\_user](#input\_vm\_user) | Password for the DB | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_public_ips"></a> [vm\_public\_ips](#output\_vm\_public\_ips) | n/a |
<!-- END_TF_DOCS -->