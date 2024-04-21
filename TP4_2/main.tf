# This file contains the terraform code to create a virtual machine on Azure

# create a public IP
resource "azurerm_public_ip" "vm_pip" {
  name                = "publicip-${var.id_efrei}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = var.allocation_method
}

# create a network interface
resource "azurerm_network_interface" "vm_nic" {
  name                = "nic-${var.id_efrei}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.internal_subnet_name_use
    subnet_id                     = data.azurerm_subnet.rg_subnet.id
    private_ip_address_allocation = var.allocation_method
    public_ip_address_id          = azurerm_public_ip.vm_pip.id
  }
}

# create a virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "devops-${var.id_efrei}"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  size                = "Standard_D2s_v3"
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
  ]

  # create a managed disk
  os_disk {
    name                = "osdisk-${var.id_efrei}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # use the latest Ubuntu Server 22.04 image
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name  = "devops-${var.id_efrei}"

  # use the public key from the tls provider
  admin_ssh_key {
    username   = var.admin_username
    public_key = tls_private_key.tls_key.public_key_openssh
  }

  # Disable SSH password authentication
  disable_password_authentication = true 

  # install Docker
  custom_data = base64encode(<<EOF
    #cloud-config
    runcmd:
      - curl -fsSL https://get.docker.com -o get-docker.sh
      - sh get-docker.sh
      - usermod -aG docker ${var.admin_username}
    EOF
  )
}