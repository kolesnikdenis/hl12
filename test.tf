terraform {
  required_version = "~> 0.14"
  required_providers {
    aws = {
      version = "~> 3.21"
    }
  }
}

provider "aws" {
  //export  AWS_ACCESS_KEY_ID="AKIAROVR3AV7WXAOQZ6W"
  //export AWS_SECRET_ACCESS_KEY="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"
  region = "us-east-1"
}