variable "aws_access_key" {
    type    = string
    default = "your_aws_access_key"
}

variable "aws_secret_key" {
    type    = string
    default = "your_aws_secret_key"
}

variable "aws_region" {
    type    = string
    default = "ap-south-1"
}



# ------------------------------------ VPC ----------------------------------------------------
variable "vpc_name" {
    type    = string
    default = "harsh-prod"
}

variable "public_subnet_cidrs" {
    type        = list(string)
    description = "public subnet cidr values"
    default     = [ "10.0.0.0/18", "10.0.64.0/19", "10.0.96.0/19" ]
}

variable "private_subnet_cidrs" {
    type        = list(string)
    description = "private subnet cidr values"
    default     = [ "10.0.128.0/18", "10.0.192.0/19", "10.0.224.0/19" ]
}

variable "azs" {
    type        = list(string)
    description = "Availability Zones in vpc"
    default     = [ "ap-south-1a", "ap-south-1b", "ap-south-1c" ]
}


variable "ec2_sg_name" {
    type    = string
    default = "harsh-ec2-sg"
}

variable "ec2_eip_name" {
    type    = string
    default = "harsh-ec2-eip"
}