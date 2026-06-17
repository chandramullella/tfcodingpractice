locals {
  inbound_rules = [
    {
      port       = 80
      cidr_block = "0.0.0.0/0"
    },
    {
      port       = 443
      cidr_block = "10.0.0.0/16"
    }
  ]
  outbound_ports = [443, 1433]
}
