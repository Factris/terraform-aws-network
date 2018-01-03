# terraform-aws-network

This a terraform module to set up a VPC on Amazon Web Services (AWS). Terraform is a powerful tool which allows you to 
maintain your infrastructure in code completely. You can set up your network in minutes. 
No need to click around in the console. To learn more about Terraform click [here](https://www.terraform.io/intro/index.html).
 
## Features
- Three public and three private subnets are created
- Routing traffic from the private network to the internet via a NAT gateway
- A Bastion host in the public subnet
- All subnet traffic is logged to CloudWatch

## Requirements
- Terraform CLI (v0.9.11)
- AWS account

## Usage
Create a terraform [configuration](https://www.terraform.io/intro/getting-started/build.html#configuration) and include 
the following:

    module "network" {
      source              = "githuburl"
      environment         = "${var.environment}"
      #The ami for the bastion host
      bastion_ami         = "${var.bastion_ami}"
      #The path to the user data, paths are relative to where you execute your script, you might want to make a local copy 
      userdata_path       = "${var.bastion_userdata_path}"
    }

Apply your Terraform configuration

## Notes

You should harden your bastion host, there are many great articles around on the interwebs about this. Also take a look 
at the Access Control Lists and Security Groups (acl.tf and sg.tf). You might want to change some things. The current 
settings allow ssh traffic to and all traffic from the bastion host. Also, traffic that is associated with Rancher server and hosts is 
allowed in the private subnet.
 

