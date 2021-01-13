module "simple" {
  source    = "./modules/vm"
  suffix    = "simple"
  user_data = <<EOF
#cloud-config

package_upgrade: true
package_update: true
packages:
  - nginx
EOF
}
