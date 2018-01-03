# The security group for the bastion host
resource "aws_security_group" "bastion" {
  name        = "${var.environment}-secgroup-bastion"
  description = "instance bastion security group"
  vpc_id      = "${aws_vpc.vpc.id}"

  # allow ssh traffic, you should restrict this to only local own ip-range
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allow all outgoing traffic, you should definately restrict this
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name            = "${var.environment}-bastion-instance"
    Environment     = "${var.environment}"
    Terraform       = "True"
  }
}


output "bastion_sg" { value = "${aws_security_group.bastion.id}" }