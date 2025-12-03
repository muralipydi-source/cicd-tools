locals{
    ami_id = "ami-09c813fb71547fc4f" #data.aws_ami.joindevops.AMI_ID  #"ami-09c813fb71547fc4f" #data.aws_ami.joindevops.id
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
}