module "script" {
  source    = "./modules/vm"
  suffix    = "script"
  user_data = <<EOF
#!/bin/bash
apt-get update
apt-get install -y nginx
echo "<h1>Hello from script</h1>" > /var/www/html/index.nginx-debian.html
EOF
}
