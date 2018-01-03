# Route table for the public subnets
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name = "${var.environment}-public",
    Env = "${var.environment}"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public-failover" {
  subnet_id = "${aws_subnet.public_failover.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public-failover-2" {
  subnet_id = "${aws_subnet.public_failover_2.id}"
  route_table_id = "${aws_route_table.public.id}"
}

# Route table for the private subnets
resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.public-outbound.id}"
  }
  tags {
    Name = "${var.environment}-private",
    Env = "${var.environment}"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id = "${aws_subnet.private.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private_failover" {
  subnet_id = "${aws_subnet.private_failover.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private_failover_2" {
  subnet_id = "${aws_subnet.private_failover_2.id}"
  route_table_id = "${aws_route_table.private.id}"
}

output "public-route-table-id"   { value = "${aws_route_table.public.id}" }
output "private-route-table-outbound-id"   { value = "${aws_route_table.private.id}" }