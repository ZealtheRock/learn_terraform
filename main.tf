provider "aws" {
    region = "us-west-2"
}

resource "aws_vpc" "my_vpc_demo"{
    name = "my_vpc_demo"
    cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "my_subnet"{
    vpc_id = aws_vpc.my_vpc_demo.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "us-west-2a"
}
data "aws_vpc" "existing_vpc"{
   default = true
}
resource "aws_subnet" "my_subnet_2"{
    vpc_id = data.aws_vpc.existing_vpc.id
    cidr_block = "172.31.45.0/24"
    availability_zone = "us-west-2a"
}