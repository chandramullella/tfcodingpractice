data "aws_ami" "amazon_ami_2" {

}

resource "aws_instance" "my_instance" {
  count         = 1
  instance_type = "t2.nano"
  ami           = "ami-12345678901234567"

  tags = {
    Name = join("-", ["web", "app", count.index + 1])
  }
}
