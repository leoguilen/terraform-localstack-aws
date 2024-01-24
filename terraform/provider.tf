terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # backend "s3" {
  #   bucket = "terraform-state-bucket"
  #   key    = "terraform.tfstate"
  #   region = "us-east-1"
  #   use_path_style = true
  # }
}

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]

  default_tags {
    tags = {
      Project     = "terraform-localstack-aws"
      Environment = "terraform"
    }
  }
}
