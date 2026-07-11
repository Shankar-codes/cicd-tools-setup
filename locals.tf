locals {
  ami_id = data.aws_ami.jenkins.id
  zone_id=var.zone_id
  domain_name=var.domain_name
  common_tags = {
    Name        = "Jenkins-Server"
    Environment = "dev"
    Terraform   = "true"
  }
}
