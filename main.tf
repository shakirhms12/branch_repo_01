#1 provider
provider "aws" {
  region     = var.region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

#2instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-012485deee5681dc0" # Example for Amazon Linux 2 in us-east-1 region
  instance_type = "t2.micro"
  # Add tags to the instance
  tags = {
    Name        = "webserver-${terraform.workspace}"
    Environment = terraform.workspace
    Branch      = terraform.workspace
  }
}