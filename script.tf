module "script" {
  source    = "./modules/vm"
  suffix    = "script"
  user_data = <<EOF
#!/bin/bash
apt-get update
apt-get install -y nginx
EOF
}
