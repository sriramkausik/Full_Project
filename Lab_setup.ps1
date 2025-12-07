# Define variables

$BucketName = "terraform-statefile-v1.1"
$Region     = "us-east-1"
$PolicyFile = "E:\Full_Project\bucket-policy.json"

# 1. Create the bucket
aws s3api create-bucket `
    --bucket $BucketName `
    --region $Region

# 2. Disable block public access
aws s3api put-public-access-block `
    --bucket $BucketName `
    --public-access-block-configuration `
        "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"

# 3. Build JSON policy object directly in PowerShell
$policyJson = @{
    Version   = "2012-10-17"
    Statement = @(
        @{
            Sid       = "PublicReadGetObject"
            Effect    = "Allow"
            Principal = "*"
            Action    = "s3:GetObject"
            Resource  = "arn:aws:s3:::$BucketName/*"
        }
    )
} | ConvertTo-Json -Depth 3

# Write JSON to file (no BOM, clean UTF8)
[System.IO.File]::WriteAllText($PolicyFile, $policyJson)

# 4. Apply the bucket policy
aws s3api put-bucket-policy `
    --bucket $BucketName `
    --policy file://$PolicyFile

# 5. Verify the bucket policy
aws s3api get-bucket-policy `
    --bucket $BucketName

#setting up terraform workspaces.
Set-Location -Path "E:\Full_Project\templates\ec2"
terraform init
terraform workspace new dev_app1_ec2
#terraform plan -var-file="dev/App1/dev_app1_ec2.tfvars" 
terraform apply -var-file="dev/App1/dev_app1_ec2.tfvars" -auto-approve

terraform workspace new dev_app2_ec2
#terraform plan -var-file="dev/App2/dev_app2_ec2.tfvars"
terraform apply -var-file="dev/App2/dev_app2_ec2.tfvars" -auto-approve


terraform workspace new stg_app1_ec2
#terraform plan -var-file="stg/App1/stg_app1_ec2.tfvars"
terraform apply -var-file="stg/App1/stg_app1_ec2.tfvars" -auto-approve

terraform workspace new stg_app2_ec2
#terraform plan -var-file="stg/App2/stg_app2_ec2.tfvars"
terraform apply -var-file="stg/App2/stg_app2_ec2.tfvars" -auto-approve

terraform workspace new prd_app1_ec2
#terraform plan -var-file="prd/App1/prd_app1_ec2.tfvars"
terraform apply -var-file="prd/App1/prd_app1_ec2.tfvars" -auto-approve

terraform workspace new prd_app2_ec2
#terraform plan -var-file="prd/App2/prd_app2_ec2.tfvars"
terraform apply -var-file="prd/App2/prd_app2_ec2.tfvars" -auto-approve

