locals{
    ami_id = "ami-09c813fb71547fc4f" #data.aws_ami.joindevops.id  # #data.aws_ami.joindevops.id
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
}