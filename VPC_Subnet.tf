

resource "aws_vpc" "VPCTF" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnetTF" {
  vpc_id = aws_vpc.VPCTF.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  
  tags = {
    Name=var.subnet_name
  }

}

resource "aws_internet_gateway" "gwTF" {
  vpc_id = aws_vpc.VPCTF.id

  tags = {
    Name = var.internet_gateway_name
  }
}
resource "aws_route_table" "RouteTableAssignment2TF" {
  vpc_id = aws_vpc.VPCTF.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gwTF.id
  }



  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "tableassociation" {
  subnet_id      = aws_subnet.subnetTF.id
  route_table_id = aws_route_table.RouteTableAssignment2TF.id
}