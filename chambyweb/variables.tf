variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}
variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "asg_min_size" {
  default = 2
}
variable "asg_max_size" {
  default = 4
}
variable "asg_desired_size" {
  default = 2
}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "dns_zone_id" {}
variable "dns_www_name" {}
