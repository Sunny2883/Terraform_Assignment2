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