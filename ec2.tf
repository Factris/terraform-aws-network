# The bastion host, use a "secure" OS. You should also harden your bastion host
resource "aws_instance" "bastion" {
  ami = "${var.bastion_ami}"
  availability_zone = "${data.aws_region.current.id}a"
  instance_type = "${var.bastion_instance_type}"
  subnet_id = "${aws_subnet.public.id}"
  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
  source_dest_check = true
  user_data = "${data.template_file.user-data.rendered}"
  root_block_device {
    volume_type = "standard"
    volume_size =  8
    delete_on_termination = true
  }

  tags {
    Name = "${var.environment}-bastion"
    Env = "${var.environment}"
  }
}

output "bastion-instance-id"            { value = "${aws_instance.bastion.id}" }
output "bastion-instance-private-ip"    { value = "${aws_instance.bastion.private_ip}"}
output "bastion-instance-private-cidr"  { value = "${aws_instance.bastion.private_ip}/32"}
output "bastion-instance-ip"            { value = "${aws_instance.bastion.public_ip}"}
