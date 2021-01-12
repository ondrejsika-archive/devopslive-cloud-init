data "digitalocean_ssh_key" "ondrejsika" {
  name = "ondrejsika"
}

resource "digitalocean_droplet" "main" {
  image  = "docker-18-04"
  name   = "cloud-init-example"
  region = "fra1"
  size   = "s-2vcpu-2gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ondrejsika.id
  ]
  user_data = <<EOF
#!/bin/bash
apt-get update
apt-get install -y nginx
EOF
}

resource "cloudflare_record" "do" {
  zone_id = local.zone_id

  name    = "cloud-init-do"
  value   = digitalocean_droplet.main.ipv4_address
  type    = "A"
  proxied = false
}
