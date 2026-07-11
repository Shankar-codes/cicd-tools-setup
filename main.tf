resource "aws_instance" "jenkins" {
  ami           = locals.ami_id
  instance_type = "t3.small"
  
  tags = {
    Name = "Jenkins-Server"
  }
}