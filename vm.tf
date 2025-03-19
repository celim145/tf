resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-0fc5d935ebf8bc3bc"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = "subnet-0a2dd12675f558747"
  vpc_security_group_ids      = ["sg-0658469851d83c18d"]
  associate_public_ip_address = true
  tags = {
    name = "vm-terraform"
  }
}