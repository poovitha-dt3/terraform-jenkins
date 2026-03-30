variable "aws_region" {
  description = "AWS Region for Viz-ai"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR Block Value for Viz-ai"
  type        = string
}

variable "vpc_name" {
  description = "VPC name of the Viz_ai"
  type        = string
  default     = "automation_vpc_viz_ai"
}

variable "owner" {
  description = "Owner name for the resources"
  type        = string
  default     = "Viz_ai Automation Team"
}

variable "project_name" {
  description = "Name of the Project"
  type        = string

}

variable "public_subnet_cidr" {
  description = "Public Subnet CIDR Value"
  type        = string
}

variable "private_subnet_1_cidr" {
  description = "Private Subnet 1 CIDR Value"
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "Private Subnet 2 CIDR Value"
  type        = string
}

variable "private_subnet_3_cidr" {
  description = "Private Subnet 3 CIDR Value"
  type        = string
}

variable "az_1" {
  description = "Availability Zone for Private Subnet 1"
  type        = string
}

variable "az_2" {
  description = "Availability Zone for Private Subnet 2"
  type        = string
}

variable "az_3" {
  description = "Availability Zone for Private Subnet 3"
  type        = string
}

# variable "igw_name" {
#   description = "Name tag for Internet Gateway"
#   type        = string
#   default     = "viz_ai_igw"
# }

variable "destination_cidr_block" {
  description = "Destination CIDR Block for Route"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for Viz-ai"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

