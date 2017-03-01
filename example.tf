provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.brad.key_name}"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

resource "aws_key_pair" "brad" {
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCv4t93n9yoQESRL+uP1u0HiuaV2ZNTU4PAK1gvXyo2010pgnetQSmJ3VUhp8SUEflk4s34MkXXSJ24rFh+4a/Z2j67n7cybwoqIaV007/BeTqoBMj2ZV2sgFbvMULYxS3cDOGCy9PC+F639iPpKT9osRYgVj3XDswH7wed6Mg324QsQQK1B7wKqg0F9NXGHuCo//Q3pDTsRUjm5HqUNPJZEPHXdNWM1M/4nf6ic3LuFygT4zhUYzxN5w83Dxi2MGYIEIjQQ473xHFR94t8ooK0n6QuOTf1qMM0RnrrrzDHfYqR2mn5Gp8nXKL6Z27hAq4yNiNGJZDLYY2j/f2YOlUt chamby@gmail.com"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
