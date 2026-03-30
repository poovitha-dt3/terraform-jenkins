resource "aws_vpc" "viz_ai_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name    = var.vpc_name
    owner   = var.owner
    project = var.project_name
  }
  enable_dns_support   = true
  enable_dns_hostnames = true

}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.viz_ai_vpc.id
  cidr_block = var.public_subnet_cidr
  tags = {
    project = var.project_name
    owner   = var.owner
  }

}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.viz_ai_vpc.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = var.az_1
  tags = {
    project = var.project_name
    owner   = var.owner
  }

}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.viz_ai_vpc.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = var.az_2
  tags = {
    project = var.project_name
    owner   = var.owner
  }

}

resource "aws_subnet" "private_3" {
  vpc_id            = aws_vpc.viz_ai_vpc.id
  cidr_block        = var.private_subnet_3_cidr
  availability_zone = var.az_3
  tags = {
    project = var.project_name
    owner   = var.owner
  }

}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.viz_ai_vpc.id
  tags = {
    Name    = "viz-ai-igw"
    owner   = var.owner
    project = var.project_name
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name    = "viz-ai-nat-eip"
    owner   = var.owner
    project = var.project_name
  }
  depends_on = [aws_internet_gateway.igw]
}

# NAT Gateway in public subnet
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id
  tags = {
    Name    = "viz-ai-nat-gw"
    owner   = var.owner
    project = var.project_name
  }
  depends_on = [aws_internet_gateway.igw]
}

# Public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.viz_ai_vpc.id
  tags = {
    Name    = "viz-ai-public-rt"
    owner   = var.owner
    project = var.project_name
  }
}

# Route for public subnet to Internet Gateway
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate public subnet with public route table
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# Private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.viz_ai_vpc.id
  tags = {
    Name    = "viz-ai-private-rt"
    owner   = var.owner
    project = var.project_name
  }
}

# Route for private subnets to NAT Gateway
resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = var.destination_cidr_block
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}

# Associate private subnets with private route table
resource "aws_route_table_association" "private_1_assoc" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_2_assoc" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_3_assoc" {
  subnet_id      = aws_subnet.private_3.id
  route_table_id = aws_route_table.private_rt.id
}





