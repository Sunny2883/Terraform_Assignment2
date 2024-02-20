
resource "aws_instance" "InstanceForAssignment2TF" {
    instance_type = var.instance_type
    ami = var.instance_ami
    key_name = "${aws_key_pair.key-tf.key_name}"
    subnet_id = aws_subnet.subnetTF.id
    security_groups = [aws_security_group.SecurityGroupAssignement2TF.id]
    associate_public_ip_address = true
    tags = {
        Name=var.Instance_name
    }
    depends_on = [ aws_s3_bucket.BucketByTF ]
  user_data = <<EOF
#!bin/bash
yum -y update
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "Hello World" > /var/www/html/index.html
    EOF
  
}