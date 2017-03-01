provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "us-east-1"
}

module "consul" {
  source = "github.com/hashicorp/consul/terraform/aws"

  key_name = "chambyweb"
  key_path = "/Users/chamby/.ssh/chambyweb.pem"
  region = "us-east-1"
  servers = "3"
}
