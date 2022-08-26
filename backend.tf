terraform {
  backend "s3" {
    bucket = "task-bucket-2828"
    key    = "task-bucket-2828/s3/terraform.tfstate"
    region = "us-east-1"
  }
}