resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.jenkins.id
  instance_type = "t3.micro"
  
  tags = {
    Name = "HelloWorld"
  }
}