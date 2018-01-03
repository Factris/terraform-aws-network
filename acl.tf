resource "aws_network_acl" "acl-public" {
  vpc_id = "${aws_vpc.vpc.id}"
  subnet_ids = ["${aws_subnet.public.id}", "${aws_subnet.public_failover.id}", "${aws_subnet.public_failover_2.id}"]

//  inbound rules
  ingress {
    from_port = 22
    to_port = 22
    rule_no = 100
    action = "allow"
    protocol = "tcp"
    cidr_block =  "0.0.0.0/0"
  }

  ingress {
    from_port = 80
    to_port = 80
    rule_no = 200
    action = "allow"
    protocol = "tcp"
    cidr_block = "0.0.0.0/0"
  }


  ingress {
    from_port = 443
    to_port = 443
    rule_no = 300
    action = "allow"
    protocol = "tcp"
    cidr_block = "0.0.0.0/0"
  }

  ingress {
    from_port = 1024
    to_port = 65535
    rule_no = 400
    action = "allow"
    protocol = "tcp"
    cidr_block = "0.0.0.0/0"
  }

//  outbound rules
  egress {
    from_port = 22
    to_port = 22
    rule_no = 100
    action = "allow"
    protocol = "tcp"
    cidr_block = "0.0.0.0/0"
  }

  egress {
    from_port = 80
    to_port = 80
    rule_no = 200
    action = "allow"
    protocol = "tcp"
    cidr_block = "0.0.0.0/0"
  }

  egress {
    from_port = 81
    to_port = 81
    rule_no = 210
    action = "allow"
    protocol = "tcp"
    cidr_block = "0.0.0.0/0"
  }

  egress {
    from_port = 443
    to_port = 443
    rule_no = 300
    action = "allow"
    protocol = "tcp"
    cidr_block = "0.0.0.0/0"
  }

  egress {
    from_port = 1024
    to_port = 65535
    rule_no = 400
    action = "allow"
    protocol = "tcp"
    cidr_block = "0.0.0.0/0"
  }

  tags {
    Name = "${var.environment}-acl-public"
    Env = "${var.environment}"
  }
}

resource "aws_network_acl" "acl-private" {
  vpc_id = "${aws_vpc.vpc.id}"
  subnet_ids = [ "${aws_subnet.private.id}", "${aws_subnet.private_failover.id}", , "${aws_subnet.private_failover_2.id}"]

  ingress {
    from_port = 22
    to_port = 22
    rule_no = 300
    action = "allow"
    protocol = "tcp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  ingress {
    from_port = 42
    to_port = 42
    rule_no = 10
    action = "allow"
    protocol = "tcp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  ingress {
    from_port = 80
    to_port = 80
    rule_no = 100
    action = "allow"
    protocol = "tcp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  ingress {
    from_port = 81
    to_port = 81
    rule_no = 105
    action = "allow"
    protocol = "tcp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  ingress {
    from_port = 443
    to_port = 443
    rule_no = 110
    action = "allow"
    protocol = "tcp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  # rancher host ipsec
  ingress {
    from_port = 500
    to_port = 500
    rule_no = 115
    action = "allow"
    protocol = "udp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  # rancher host ipsec
  ingress {
    from_port = 4500
    to_port = 4500
    rule_no = 116
    action = "allow"
    protocol = "udp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  ingress {
    from_port = 8080
    to_port = 8080
    rule_no = 120
    action = "allow"
    protocol = "tcp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  ingress {
    from_port = 9345
    to_port = 9345
    rule_no = 130
    action = "allow"
    protocol = "tcp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  ingress {
    from_port = 1024
    to_port = 65535
    rule_no = 200
    action = "allow"
    protocol = "tcp"
    cidr_block = "0.0.0.0/0"
  }

  ingress {
    from_port = 1024
    to_port = 65535
    rule_no = 400
    action = "allow"
    protocol = "udp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  egress {
    from_port = 42
    to_port = 42
    rule_no = 10
    action = "allow"
    protocol = "tcp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  egress {
    from_port = 80
    to_port = 80
    rule_no = 100
    action = "allow"
    protocol = "tcp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  egress {
    from_port = 81
    to_port = 81
    rule_no = 105
    action = "allow"
    protocol = "tcp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  egress {
    from_port = 443
    to_port = 443
    rule_no = 110
    action = "allow"
    protocol = "tcp"
    cidr_block = "0.0.0.0/0"
  }

  # rancher host ipsec
  egress {
    from_port = 500
    to_port = 500
    rule_no = 115
    action = "allow"
    protocol = "udp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  # rancher host ipsec
  egress {
    from_port = 4500
    to_port = 4500
    rule_no = 116
    action = "allow"
    protocol = "udp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  egress {
    from_port = 8080
    to_port = 8080
    rule_no = 120
    action = "allow"
    protocol = "tcp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  egress {
    from_port = 9345
    to_port = 9345
    rule_no = 130
    action = "allow"
    protocol = "tcp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  egress {
    from_port = 1024
    to_port = 65535
    rule_no = 200
    action = "allow"
    protocol = "tcp"
    cidr_block = "0.0.0.0/0"
  }

  egress {
    from_port = 1024
    to_port = 65535
    rule_no = 300
    action = "allow"
    protocol = "udp"
    cidr_block = "${aws_vpc.vpc.cidr_block}"
  }

  tags {
    Name = "${var.environment}-acl-private"
    Env = "${var.environment}"
  }
}