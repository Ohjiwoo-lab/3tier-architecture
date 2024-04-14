# 백엔드로 사용될 S3 버킷 생성
resource "aws_s3_bucket" "tfstate" {
    bucket = "jiwoo-backend-tfstate"
}

# S3 버킷 버저닝 활성화
resource "aws_s3_bucket_versioning" "s3_versioning" {
    bucket = aws_s3_bucket.tfstate.id
    
    versioning_configuration {
        status = "Enabled"
    }
}

# locking을 위한 DynamoDB 생성
resource "aws_dynamodb_table" "terraform_state_lock" {
    name           = "terraform-lock"
    hash_key       = "LockID"
    billing_mode   = "PAY_PER_REQUEST"

     attribute {
        name = "LockID"
        type = "S"
    }
}