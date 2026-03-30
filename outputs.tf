# VPC Outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.viz_ai_vpc.id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.viz_ai_vpc.cidr_block
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.viz_ai_vpc.arn
}

output "vpc_name" {
  description = "The name of the VPC"
  value       = aws_vpc.viz_ai_vpc.tags["Name"]
}

# Public Subnet Outputs
output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public.id
}

output "public_subnet_cidr" {
  description = "The CIDR block of the public subnet"
  value       = aws_subnet.public.cidr_block
}

output "public_subnet_arn" {
  description = "The ARN of the public subnet"
  value       = aws_subnet.public.arn
}

# Private Subnet 1 Outputs
output "private_subnet_1_id" {
  description = "The ID of the first private subnet"
  value       = aws_subnet.private_1.id
}

output "private_subnet_1_cidr" {
  description = "The CIDR block of the first private subnet"
  value       = aws_subnet.private_1.cidr_block
}

output "private_subnet_1_arn" {
  description = "The ARN of the first private subnet"
  value       = aws_subnet.private_1.arn
}

output "private_subnet_1_az" {
  description = "The availability zone of the first private subnet"
  value       = aws_subnet.private_1.availability_zone
}

# Private Subnet 2 Outputs
output "private_subnet_2_id" {
  description = "The ID of the second private subnet"
  value       = aws_subnet.private_2.id
}

output "private_subnet_2_cidr" {
  description = "The CIDR block of the second private subnet"
  value       = aws_subnet.private_2.cidr_block
}

output "private_subnet_2_arn" {
  description = "The ARN of the second private subnet"
  value       = aws_subnet.private_2.arn
}

output "private_subnet_2_az" {
  description = "The availability zone of the second private subnet"
  value       = aws_subnet.private_2.availability_zone
}

# Private Subnet 3 Outputs
output "private_subnet_3_id" {
  description = "The ID of the third private subnet"
  value       = aws_subnet.private_3.id
}

output "private_subnet_3_cidr" {
  description = "The CIDR block of the third private subnet"
  value       = aws_subnet.private_3.cidr_block
}

output "private_subnet_3_arn" {
  description = "The ARN of the third private subnet"
  value       = aws_subnet.private_3.arn
}

output "private_subnet_3_az" {
  description = "The availability zone of the third private subnet"
  value       = aws_subnet.private_3.availability_zone
}

# S3 Bucket Outputs
output "s3_bucket_id" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.viz_ai_bucket.id
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.viz_ai_bucket.arn
}

output "s3_bucket_region" {
  description = "The region of the S3 bucket"
  value       = aws_s3_bucket.viz_ai_bucket.region
}

output "s3_bucket_domain_name" {
  description = "The bucket domain name"
  value       = aws_s3_bucket.viz_ai_bucket.bucket_regional_domain_name
}
