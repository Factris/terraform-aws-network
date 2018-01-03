data "aws_region" "current" { current = true }

variable "environment"                { default = "development" }
# The retention of the flow logs in days
variable "log_retention"              { default = 365 }

# Avoid using 10.0.0.0/X, because it will cause many problems
variable "cidr"                       { default = "172.16.0.0/16"}
# The AMI for the bastion host. You should use something like RHEL or CentOs. Don't forget to harden your instance!
variable "bastion_ami"                {}
# The instance type of the bastion host
variable "bastion_instance_type"      { default = "t2.micro" }
# The path to the user data for the bastion host
variable "userdata_path"              { default = "./userdata/bastion.yml" }
# The authorized keys of the users that are allowed to connect to your bastion host.
variable "authorized_keys"            { default = "./authorized_keys/authorized_keys" }
