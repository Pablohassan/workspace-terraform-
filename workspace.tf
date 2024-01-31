terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
}
# la région aws ou nous voulons déployer nos différentes ressources
provider "aws" {
    region = "eu-west-3"
   
}

variable "environment" {
  type    = string
  default = "dev"
}
resource "aws_iam_policy" "datascientest_s3_policy" {
  name = "datascientest_s3_policy_for_${var.environment}"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "s3:GetObject",
        "Resource" : "*"
    }]
  })
}
