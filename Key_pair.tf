resource "aws_key_pair" "key-tf" {
  key_name ="my-newkeypair"
  public_key = file("${path.module}/id_rsa.pub")
}