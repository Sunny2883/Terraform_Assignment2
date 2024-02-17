

resource "aws_vpc" "VPCTF" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "VPCTF"
  }
}

resource "aws_subnet" "subnetTF" {
  vpc_id = aws_vpc.VPCTF.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  
  tags = {
    Name="subnetTF"
  }

}

resource "aws_internet_gateway" "gwTF" {
  vpc_id = aws_vpc.VPCTF.id

  tags = {
    Name = "gwTF"
  }
}
resource "aws_route_table" "RouteTableAssignment2TF" {
  vpc_id = aws_vpc.VPCTF.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gwTF.id
  }



  tags = {
    Name = "routeTF"
  }
}

resource "aws_route_table_association" "tableassociation" {
  subnet_id      = aws_subnet.subnetTF.id
  route_table_id = aws_route_table.RouteTableAssignment2TF.id
}