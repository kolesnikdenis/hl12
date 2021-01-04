resource "aws_instance" "this" {
  ami                    = "ami-0885b1f6bd170450c"
  instance_type          = ( var.my_instance_type )
  vpc_security_group_ids = [aws_security_group.this.id]
  tags                   = local.common_tags
}

resource "aws_eip" "this" {
  count = ( var.aip_attach ? 1 : 0 )
  instance = aws_instance.this.id
  tags = local.common_tags 
}

resource "aws_security_group" "this" {
  name_prefix = "temporary"
  tags = local.common_tags
  description = " temporary SG for hillel class 17"

  egress { 
    from_port = 0 
   to_port = 0
   protocol  = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}

resource "aws_security_group_rule" "SSH" {
  description = "Allow ssh"
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}
  

resource "aws_security_group_rule" "http" {
  description = "Allow http"
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}


resource "aws_security_group_rule" "https" {
  description = "Allow http"
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}


output "instance_pub_ip" {
  value = aws_instance.this.public_ip
  sensitive = false
}

output "instance_pub_dns"{ 
  value = aws_instance.this.public_dns
}


output "elastic_ip" {
  value = aws_eip.this.*.public_ip

  //value ="${aws_eip.this.*.id[count.index]}" 
 //value = aws_eip.this.*.public_ip[aws_eip.this.count.index]
 //value = { for k, v in aws_eip.this : k => v.id }

}