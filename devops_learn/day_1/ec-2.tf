# resource "aws_instance" "Hello" {
#     ami = "ami-0c628a79a7a56ab36"
#     instance_type = "t2.micro"
#     key_name = "devops"
#     tags={
#         Name = "CSE" 
#     }
  
# }

# output "id" {
#   value = aws_instance.Hello.id
#   description = "AWS Instance ID"
# }

# output "Public_IP" {
#   description = "Public IP"
#   value = aws_instance.Hello.public_ip
# }


# data "aws_iam_policy_document" "assume_role" {
#   statement {
#     effect = "Allow"

#     principals {
#       type        = "Service"
#       identifiers = ["lambda.amazonaws.com"]
#     }

#     actions = ["sts:AssumeRole"]
#   }
# }

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy.Lambda_Policy.arn
}


data "aws_iam_policy" "Lambda_Policy" {
    arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "conv" {
    function_name = "currency-converter"
    filename = "python.zip"
    runtime = "python3.11"
    handler = "converter.lambda_handler"
    role = aws_iam_role.iam_for_lambda.arn
}


# resource "aws_instance" "Isaac" {
#   key_name = "devops"
#   instance_type =  "t2.micro"
#   ami = "ami-03f4878755434977f"
# }

# output "IP" {
#   value = aws_instance.Isaac.public_ip
#   description = "The publickey"
  
# }