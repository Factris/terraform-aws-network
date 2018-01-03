# Creates subnets based on the CIDR that is provided

resource "aws_subnet" "private" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${cidrsubnet(var.cidr, 8, 1)}"
  availability_zone = "${data.aws_region.current.id}a"

  tags {
    Name = "${var.environment}-subnet-private",
    Env = "${var.environment}"
  }
}

resource "aws_subnet" "private_failover" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${cidrsubnet(var.cidr, 8, 2)}"
  availability_zone = "${data.aws_region.current.id}b"

  tags {
    Name = "${var.environment}-subnet-private_failover",
    Env = "${var.environment}"
  }
}

resource "aws_subnet" "private_failover_2" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${cidrsubnet(var.cidr, 8, 3)}"
  availability_zone = "${data.aws_region.current.id}c"

  tags {
    Name = "${var.environment}-subnet-private_failover_2",
    Env = "${var.environment}"
  }
}

resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${cidrsubnet(var.cidr, 8, 4)}"
  availability_zone = "${data.aws_region.current.id}a"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.environment}-subnet-public",
    Env = "${var.environment}"
  }
}

resource "aws_subnet" "public_failover" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${cidrsubnet(var.cidr, 8, 5)}"
  availability_zone = "${data.aws_region.current.id}b"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.environment}-subnet-public_failover",
    Env = "${var.environment}"
  }
}

resource "aws_subnet" "public_failover_2" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${cidrsubnet(var.cidr, 8, 6)}"
  availability_zone = "${data.aws_region.current.id}c"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.environment}-subnet-public_failover_2",
    Env = "${var.environment}"
  }
}

output "private_subnet_list"   { value = ["${aws_subnet.private.id}", "${aws_subnet.private_failover.id}", "${aws_subnet.private_failover_2.id}" ] }
output "public_subnet_list"   { value = ["${aws_subnet.public.id}", "${aws_subnet.public_failover.id}", "${aws_subnet.public_failover_2.id}" ] }
output "av_zone_list"          { value = ["${aws_subnet.private.availability_zone}", "${aws_subnet.private_failover.availability_zone}", "${aws_subnet.private_failover_2.availability_zone}" ] }
