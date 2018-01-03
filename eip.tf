# Elastic ip, used by the nat gateway
resource "aws_eip" "nat" {
  vpc = true
}