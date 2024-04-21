# This file is used to generate a pair of SSH keys using Terraform. The private key is stored in a file named id_rsa and the public key is stored in a file named id_rsa.pub.

# generate a pair of SSH keys using Terraform
resource "tls_private_key" "tls_key" {
  algorithm = "RSA"   
  rsa_bits  = 4096
}

# store the private keys in files named id_rsa
resource "local_file" "private_key_file" {
  content         = tls_private_key.tls_key.private_key_pem
  filename        = "${path.module}/id_rsa"  
  file_permission = "0600"                   
}

# store the public keys in files named id_rsa.pub
resource "local_file" "public_key_file" {
  content     = tls_private_key.tls_key.public_key_openssh
  filename    = "${path.module}/id_rsa.pub" 
}
