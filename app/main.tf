terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  # See /code/03-basics/aws-backend
  #backend "s3" {
  #  bucket         = "devops-directive-tf-state"
  #  key            = "06-organization-and-modules/web-app/terraform.tfstate"
  #  region         = "eu-west-1"
  #  dynamodb_table = "terraform-state-locking"
  #  encrypt        = true
  #}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

variable "db_pass_1" {
  description = "password for database #1"
  type        = string
  sensitive   = true
}

variable "db_pass_2" {
  description = "password for database #2"
  type        = string
  sensitive   = true
}

module "web_app_1" {
  source = "./app-modules"

  # Input Variables
  bucket_prefix    = "web-app-1-data"
  domain           = "orion-arm.io"
  app_name         = "web-app-1"
  environment_name = "production"
  instance_type    = "t2.micro"
  create_dns_zone  = true
  db_name          = "webapp1db"
  db_user          = "dbuser1"
  db_pass          = var.db_pass_1
}

module "web_app_2" {
  source = "./app-modules"

  # Input Variables
  bucket_prefix    = "web-app-2-data"
  domain           = "orion-arm2.io"
  app_name         = "web-app-2"
  environment_name = "production"
  instance_type    = "t2.micro"
  create_dns_zone  = true
  db_name          = "webapp2db"
  db_user          = "dbuser2"
  db_pass          = var.db_pass_2
}