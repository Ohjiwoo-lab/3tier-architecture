# 백엔드를 S3 버킷으로 지정하기
terraform {
    backend "s3" {
      bucket         = "jiwoo-backend-tfstate"
      key            = "three_tier_architecutre/terraform/terraform.tfstate"
      region         = "ap-northeast-2"  
      encrypt        = true
      dynamodb_table = "terraform-lock"
    }
}