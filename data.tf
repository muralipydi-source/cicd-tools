/* 
data "aws_ami" "joindevops" {

    most_recent = true
    owners = ["973714476881"]  #898080060887 973714476881

    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    filter {
    name   = "id"
    values = ["ami-09c813fb71547fc4f"]
  }

  filter {
    name   = "AMI name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "Platform details"
    values = ["Red Hat Enterprise Linux"]
  }

  filter {
    name   = "Image type"
    values = ["machine"]
  }

  filter {
    name   = "Architecture"
    values = ["x86_64"]
  }
}
 */