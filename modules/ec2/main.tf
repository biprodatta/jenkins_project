resource "aws_instance" "web" {
  ami           = ami-02d1e544b84bf7502
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
