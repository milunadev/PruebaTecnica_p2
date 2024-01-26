data "aws_vpc" "default" {
  default = true
}

# subredes públicas
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
  tags = {
    "Tier" = "public"
  }
}

# subredes privadas
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
  tags = {
    "Tier" = "private"
  }
}
