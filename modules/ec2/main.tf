data "aws_caller_identity" "current" {}

data "aws_ami" "ec2_instance" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["${data.aws_caller_identity.current.account_id}"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ec2_instance.id
  instance_type = "t3.micro"

  user_data = <<-EOL
  #!/bin/bash -xe
  
  curl -fsSL https://get.docker.com | sh;
  yum search docker
  yum info docker
  yum install docker
  sudo usermod -aG docker $USER
  chmod 666 /var/run/docker.sock
  systemctl start docker
  docker version
  EOL

  tags = {
    Name = "terraform_project"
  }
}
