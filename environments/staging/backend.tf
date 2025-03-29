resource "aws_s3_bucket" "terraform_state" {
  bucket = "staging-wine-support-terraform"
  lifecycle {
    create_before_destroy = false
    prevent_destroy       = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

terraform {
  backend "s3" {
    bucket = "ymmr-staging-terraform-state"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
