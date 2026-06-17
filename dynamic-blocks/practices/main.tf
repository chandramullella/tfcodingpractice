data "aws_vpc" "myvpc" {
  tags = {
    Name = "chandra-vpc"
  }
}

resource "aws_security_group" "mysg" {
  vpc_id      = data.aws_vpc.myvpc.id
  name        = "webserver"
  description = "Security group dynamic block"

  dynamic "ingress" {
    for_each = local.inbound_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = [ingress.value.cidr_block]
    }
  }

  dynamic "egress" {
    for_each = local.outbound_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }
  }


}
