terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "default" {
  name       = "JesusArrioja"
  public_key = file("keys/terraform.pub")
}

resource "digitalocean_droplet" "test-ssh" {
  name       = "test-ssh"
  region     = "nyc3"
  image      = "ubuntu-22-04-x64"
  monitoring = true
  size       = "s-1vcpu-1gb"
  ssh_keys   = [digitalocean_ssh_key.default.fingerprint]

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("keys/terraform")
    host        = self.ipv4_address
  }
  provisioner "file" {
    source      = "scripts/install_nginx.sh"
    destination = "/tmp/install_nginx.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install_nginx.sh",
      "/tmp/install_nginx.sh",
    ]
  }

  tags = ["ssh", "http-server"]
}

output "droplet_ip" {
  value = "http://${digitalocean_droplet.test-ssh.ipv4_address}"
}
