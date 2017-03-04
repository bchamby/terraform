provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_elb" "chambyweb-elb" {
  name               = "chambyweb-elb"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

}

resource "aws_autoscaling_group" "chambyweb-asg" {
  availability_zones        = ["us-east-1a", "us-east-1b", "us-east-1c"]
  name                      = "chambyweb-us-east"
  max_size                  = 4
  min_size                  = 2
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.chambyweb-lc.name}"
  load_balancers            = ["${aws_elb.chambyweb-elb.name}"]
}

resource "aws_launch_configuration" "chambyweb-lc" {
  name            = "chambyweb-lc"
  image_id        = "ami-82a67294"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.allow-http.id}"]
  key_name        = "chambyweb"
}

resource "aws_security_group" "allow-http" {
  name        = "allow-http"
  description = "Allow HTTP traffic to LB"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "chambyweb"
  }
}

resource "aws_route53_record" "www" {
  zone_id = "Z36Z4PT7NFJUY"
  name    = "www.chamby.io"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_elb.chambyweb-elb.dns_name}"]
}
