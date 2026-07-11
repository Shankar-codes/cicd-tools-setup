resource "aws_instance" "jenkins" {
  ami           = locals.ami_id
  instance_type = "t3.small"
  vpc_security_group_ids = [aws_security_group.main.id]
  subnet_id=aws_subnet.main.id
  
    # need more for terraform
  root_block_device {
    volume_size = 50
    volume_type = "gp3" # or "gp2", depending on your preference
  }

  user_data = file("jenkins.sh")

  tags = {
    Name = "Jenkins-Server"
  }
}

resource "aws_instance" "jenkins_agent" {
  ami           = locals.ami_id
  instance_type = "t3.small"
  vpc_security_group_ids = [aws_security_group.main.id]
  subnet_id=aws_subnet.main.id
  
    # need more for terraform
  root_block_device {
    volume_size = 50
    volume_type = "gp3" # or "gp2", depending on your preference
  }

  user_data = file("jenkins-agent.sh")

  tags = {
    Name = "Jenkins-Agent-Server"
  }
}

########## Security Group Creation ##########
resource "aws_security_group" "main" {
  name        = "jenkins-sg"
  description = "Security group for Jenkins server"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }
     egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
     }
}

