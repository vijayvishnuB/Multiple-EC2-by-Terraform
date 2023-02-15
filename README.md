# Multiple-EC2-by-Terraform
Creating a Multiple EC2 instance by Terraform

First install the Terraform in any operating system
# I have used ubuntu for installing Terraform
 In that use command as "sudo apt install terraform"
 
# Creating EC2 instance with terraform
These are commands to deploy the EC2 instance by using Terraform:
  terraform init 
  terraform plan 
  terraform apply 
  terraform show 
  
# In that command line 
# Create directory for terraform as "mkdir Terraform"
    create two files inside the terraform file and the files are
    ec2.tf
    provider.tf

# In that ec2.tf write the command to create the instances with properties like vpc and subnets
In that ec2.tf I have created two EC2 instance 

# In that provider.tf write the command for provider details of instance like access key,secret key,..

# Save both files as ".tf"

# For viewing the details that have been deployed in the instance 
by the command terraform plan

# Deploy the instance using deploy commands given above.
by the command terraform apply

![1](https://user-images.githubusercontent.com/83658514/219050553-8942fc3b-96fb-4550-afdf-33c71fad9272.png)
![2](https://user-images.githubusercontent.com/83658514/219050562-5a776259-a63b-4b00-84b7-1cf06da8492b.png)
![3](https://user-images.githubusercontent.com/83658514/219050570-e0651bb4-3881-465f-9f8a-c551008585e5.png)
![4](https://user-images.githubusercontent.com/83658514/219050575-4078d2c4-b9a0-4958-964d-f2b13aa7a8ca.png)
![5](https://user-images.githubusercontent.com/83658514/219050544-a34394dd-21ef-4c76-bf46-ae8143278712.png)
These are the screenshots of my deployed details by using "terraform apply" command  
# It will load and deploy the details
# We can view whether the instance created or not
by the command terraform show

# Open AWS console 
Then the EC2 instance were created 
![7](https://user-images.githubusercontent.com/83658514/219050257-6076eec3-152f-4a5f-a860-f97134e63b59.png)
This is Screenshot of my AWS Management Console
# The EC2 instance will be in running state 
