module "simple" {
  source    = "./modules/vm"
  suffix    = "simple"
  user_data = <<EOF
#cloud-config

package_upgrade: true
package_update: true
packages:
  - nginx
write_files:
  - path: /var/www/html/index.nginx-debian.html
    permissions: 0644
    owner: www-data
    content: |
      <h1>Hello from Cloud Config</h1>
EOF
}
