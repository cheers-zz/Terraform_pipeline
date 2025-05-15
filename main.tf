resource "aws_instance" "test" {
    ami = "var.ami"
    instance_type = "var.type"
    key_name = "Demo"

    tags ={
        name = "jenkins server"
    }
  
}




ami-0953476d60561c955