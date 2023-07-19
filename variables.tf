variable "region" {
  description = "AWS Region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "subnet1_cidr" {
  description = "CIDR block for subnet"
  type        = string
}

variable "subnet2_cidr" {
  description = "CIDR block for subnet"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "subnet_name1" {
  description = "Name of the subnet one"
  type        = string
}

variable "subnet_name2" {
  description = "Name of the subnet two"
  type        = string
}

variable "igw_name" {
  description = "Name of the internet gateway"
  type        = string
}

variable "rt_name" {
  description = "Name of the route table"
  type        = string
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "Id of the amazon machine image"
  type        = string
}

variable "key_name" {
  description = "Name of key"
  type        = string
}

variable "instance_type" {
  description = "type of the EC2 instance"
  type        = string
}
