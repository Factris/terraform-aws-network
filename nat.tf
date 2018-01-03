# The NAT gateway that allows instances in the private network to connect to the outside world
# The NAT gateway should reside in the public subnet
resource "aws_nat_gateway" "public-outbound" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id = "${aws_subnet.public.id}"
}