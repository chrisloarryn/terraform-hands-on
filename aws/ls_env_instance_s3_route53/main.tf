data "aws_region" "current" {}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-bucket"
}

resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"

  tags = {
    Name        = "webserver-${count.index}"
    Environment = "local"
  }
}

resource "aws_route53_zone" "primary" {
  name = "chrisloarryn.sh"
}

resource "aws_route53_record" "primary_a" {
  count   = 2
  zone_id = aws_route53_zone.primary.zone_id
  name    = "webserver-${count.index}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.web[count.index].public_ip]
}