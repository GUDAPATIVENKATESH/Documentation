resource "aws_instance" "web" {
  ami                         = "ami-0735c191cf914754d"
  associate_public_ip_address = true
  availability_zone           = "us-west-2a"
  instance_type               = "t2.micro"
  key_name                    = "Venkatesh"
  subnet_id                   = "subnet-086e967b114873aad"
  vpc_security_group_ids      = ["sg-0d11680d95f9df923"]
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 1
  type              = "gp2"
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}