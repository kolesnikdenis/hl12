variable  "my_variable" {
	type = string
  default = "ami-0123test"
  description = "My test  variable"
}

variable "my_instance_type" {
  type = string
  default = "t2.micro"
  description = " my default instance: t2.micro"
}

resource "aws_key_pair" "this" {
  key_name   = "this-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1abZTORZfmcoFvncNfzCF7ZOfmtdlylfkcR7NmaCGFHkcYiw/CbLFFQHrv2bWZlcTjBI1128JpBXxKGCnLcGNpu/cugKehEpOvZFNzzrwz8AQJ+ZELznBYUzGnCdwZPdofHCflTO5/ZXE2Inzm4S3EjhJkWS0LCepyFduyrPvlY24XAViR0vNx6PCVs+6DvOOOrmmiGc2+JS2oeTEU2kBROFqj0zsz2G8IxFuHyFDwXq6P4t729M+DgwbgrtTc9HZUg8bvluz66HvJlXKRCPtyRc5KtbDHtRi2E21mJvV1OOoGzJILuvqh8zNdWlVaGbXNpXYtHKAGwnffruwGnZ7 aniaml@animal-pc"
}

locals {
  common_tags= {
    Purpose = "Education"
    Project = "Hillel"
    Class = " Class 17"
  }
}

variable "aip_attach" {
  type = bool
  default = false
  description = "selector for ElasticIP  true= create and attach "
}