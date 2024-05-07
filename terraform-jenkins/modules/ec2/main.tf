resource "aws_instance" "instance" {
  ami                         = data.aws_ami.amazon-2.id
  instance_type               = "t2.medium"
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id
  key_name                    = "ec2test"
  vpc_security_group_ids      = [var.sg_id]
  # availability_zone = data.aws_availability_zones.available
  tags = {
    Name = "addy_instance"
  }
  user_data = <<EOF
#!/bin/bash
yum update -y
yum install git -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
sudo yum install java-17-amazon-corretto-devel -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins  
  EOF
}