locals {
  ami_id = data.aws_ami.jenkins.id
  common_tags = {
    Name        = "Jenkins-Server"
    Environment = "dev"
    Terraform   = "true"
  }
}
