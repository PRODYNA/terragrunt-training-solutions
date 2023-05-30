###################
# Virtual machine #
###################
resource "azurerm_network_interface" "vm" {
  for_each = toset(local.instances) ##

  name                = "nic-wordpress-1-${each.key}" ## now we need to use the key
  location            = var.location ##
  resource_group_name = var.resource_group_name ##

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.pip_id
  }
}

resource "azurerm_network_interface_application_security_group_association" "vm" {
  for_each = azurerm_network_interface.vm ## 

  network_interface_id          = each.value.id ##
  application_security_group_id = var.asg_id
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = azurerm_network_interface.vm ## 

  name                            = "vm-wordpress-1-${var.instance_id}"
  location                        = each.value.location ## 
  resource_group_name             = each.value.resource_group_name ##
  size                            = "Standard_B2s"
  admin_username                  = "trainingadmin"
  admin_password                  = "mysecret123!"
  disable_password_authentication = false
  network_interface_ids = [
    each.value.id, 
  ] ##

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  provisioner "file" {
    content = templatefile("start-wordpress.tpl", {
      db_user = var.db_user
      db_pass = var.db_password
      db_url  = var.mysql_url
    })
    destination = "/tmp/setup.sh"

    connection {
      host     = self.public_ip_address
      user     = self.admin_username
      password = self.admin_password
      agent = false
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/setup.sh",
      "/tmp/setup.sh",
    ]

    connection {
      host     = self.public_ip_address
      user     = self.admin_username
      password = self.admin_password
      agent    = false
    }
  }
}
