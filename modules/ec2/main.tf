data "aws_ami" "amazon-2" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  owners = ["amazon"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon-2.id
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
