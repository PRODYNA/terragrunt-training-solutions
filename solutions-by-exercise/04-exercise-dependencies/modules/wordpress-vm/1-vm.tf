#######################
## NETWORK INTERFACE ##
#######################

resource "azurerm_network_interface" "vm" {
  count = length(var.pip_ids)

  name                = "${var.resource_prefix}-nic-wordpress-${count.index}"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(var.pip_ids, count.index) # retrieves a single element from a list: element(list, index)
  }
}

resource "azurerm_network_interface_application_security_group_association" "vm" {
  count = length(var.pip_ids)

  network_interface_id          = azurerm_network_interface.vm[count.index].id
  application_security_group_id = var.asg_id
}

#####################
## VIRTUAL MACHINE ##
#####################

resource "azurerm_linux_virtual_machine" "vm" {
  count = length(var.pip_ids)

  name                            = "${var.resource_prefix}-vm-wordpress-${count.index}"
  location                        = data.azurerm_resource_group.main.location
  resource_group_name             = data.azurerm_resource_group.main.name
  size                            = "Standard_B2s"
  admin_username                  = var.vm_user
  admin_password                  = var.vm_pw
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.vm[count.index].id,
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
    content = templatefile("2-start-wordpress.tpl", {
      db_user = var.db_user
      db_pass = var.db_pw
      db_url  = var.db_url
      db_name = "wordpress${count.index}"
    })
    destination = "/tmp/setup.sh"

    connection {
      host     = self.public_ip_address
      user     = self.admin_username
      password = self.admin_password
      agent    = false
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
