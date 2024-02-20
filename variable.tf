variable "s3_bucket_name" {
    description = "Name of s3 bucket"
    type = string
  
}

variable "instance_ami" {
  description = "ami id for the ec2 instance"
  type = string
}

variable "Instance_name" {
  description = "Name of the instance"
  type = string
}

variable "instance_type" {
    description = "Type of instance"
    type = string
  
}

variable "region" {
  description = "name of region"
  type = string
}

variable "vpc_name" {
  description = "name of vpc"
  type = string
  
}

variable "subnet_name" {
  description = "namwe of subnet"
  type = string
}

variable "internet_gateway_name" {
  description = "name of internet gateway"
  type = string
}

variable "route_table_name" {
  description = "name of the route table"
  type = string
}

variable "security_group_name" {
  description = "name of the srcurity group"
  type = string
  
}