Hey Hello Everyone, I'm JK. This is my code to create an Amazon S3 bucket using Terraform . I'm doing mini-POC's to make myself a knowledgable person in Terraform (AWS).

====================================================================================================================================================================================
                                                            How to run
====================================================================================================================================================================================

1. Aws configure in your CLI . Refer -> https://aws.amazon.com/cli/
2. terraform init (Initializes the terraform background)
3. terraform plan (Shows the Blueprint of the final output of the code)
4. terraform approve (Runs the terraform code and provides the output)
5. terraform destroy (To destroy the created resources)

===================================================================================================================================================================================
                                                              Inputs
===================================================================================================================================================================================

1. Bucket ACL -> give "true" for private and "false" for public
2. Bucket Name -> A string input to be given and give a globally unique name for the S3 bucket (Otherwise you'll end up seeing a error poping up).
3. Tag for the Bucket -> Give a tag for your Bucket (optional)
4. Versioning -> "true" to enable it and "false" to disable

===================================================================================================================================================================================
                                                              Outputs
===================================================================================================================================================================================

1. Bucket ARN
2. Bucket Name

===================================================================================================================================================================================
                                                           Reference Links
===================================================================================================================================================================================

1. Terraform for AWS S3 - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
2. AWS S3 - https://aws.amazon.com/s3/

XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
