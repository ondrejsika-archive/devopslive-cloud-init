resource "aws_instance" "ec2" {
  // Debian 10 AMI
  ami           = "ami-03173d987db03911c"
  instance_type = "t2.micro"
  key_name      = "ondrejsika"
  security_groups = [
    "allow_all"
  ]
  user_data = <<EOF
#!/bin/bash
apt-get update
apt-get install -y nginx curl
EOF
}

resource "cloudflare_record" "aws" {
  zone_id = local.zone_id

  name    = "cloud-init-aws"
  value   = aws_instance.ec2.public_ip
  type    = "A"
  proxied = false
}
