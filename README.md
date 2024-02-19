Create a new directory for your Terraform assignment.
-	mkdir Terraform assignment2
-	cd Terraform assignment2

Create a variables.tf file to define Terraform variables.
|Variable name|Type|
|--|--|
|S3_bucket_name|String|
|Instance ami|String|
|Instance name|String|
|Instance type|String|
|Region|String|

Then, create a terraform.tfvars file and assign values to those variables."
|Variable name|Value|
|--|--|
|s3_bucket_name|"s3bucketbytf"|
|instance_ami|"ami-06b72b3b2a773be2b"|
|Instance_name|"InstanceforAssignement2TF"|
|instance_type|"t2.micro"|
|region|"ap-south-1"|

Create a key pair for the instance.
|Name|Value|
|--|--|
|Name|my-newkeypair|

Create a s3Bucket using aws_s3_bucket resource.
|Name|Value|
|--|--|
|bucket| var.s3_bucket_name|


Create a Virtual Private Cloud (VPC) along with a subnet, internet gateway, and route table.
|Resopurce type|Name|
|--|--|
|aws_vpc|VPCTF|
|--|--|
|cidr_block|"10.0.0.0/16"|
|instance_tenancy|"default"|
|tags: Name|"VPCTF"|

|Resopurce type|Name|
|--|--|
|aws_subnet|subnetTF|
|--|--|
|vpc_id|aws_vpc.VPCTF.id|
|cidr_block|"10.0.1.0/24"|
|availability_zone| "ap-south-1a"|
|tags: Name|"subnetTF"|

|Resopurce type|Name|
|--|--|
|aws_internet_gateway|gwTF|
|--|--|
|vpc_id|aws_vpc.VPCTF.id|
|tags:name|"gwTF"|


|Resopurce type|Name|
|--|--|
|aws_route_table|RouteTableAssignment2TF|
|--|--|
|vpc_id|aws_vpc.VPCTF.id|
|cidr_block:|"0.0.0.0/0"|
|gateway_id|aws_internet_gateway.gwTF.id|
|tags:name|routeTF|

|Resopurce type|Name|
|--|--|
|aws_route_table_association|tableassociation|
|--|--|
|subnet_id|aws_subnet.subnetTF.id|
|route_table_id|aws_route_table.RouteTableAssignment2TF.id|


Then, create an AWS instance and associate it with a key pair, security group, VPC, AMI, and user data, ensuring it depends on the existence of the S3 bucket.

|Resource Property|Value|
|--|--|
|instance_type|var.instance_type|
|ami|var.instance_ami|
|key_name|${aws_key_pair.key-tf.key_name}|
|subnet_id|aws_subnet.subnetTF.id|
|security_groups|[aws_security_group.SecurityGroupAssignement2TF.id]|
|associate_public_ip_address|true|
|tags:Name |var.Instance_name|
|depends_on|[aws_s3_bucket.BucketByTF]|

Initialize the Terraform working directory to download necessary plugins and modules.
-terraform init

Generate an execution plan to review the changes Terraform will make.
-terraform plan

Apply the Terraform configuration to create the AWS resources.
-terraform apply


