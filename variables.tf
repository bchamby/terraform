variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}
variable "amis" {
  type = "map"
  default = {
    us-east-1 = "ami-0b33d91d"
    us-west-2 = "ami-f173cc91"
  }
}
