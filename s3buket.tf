provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "bucketprocess" {
  bucket = "ngwallpapers"
  tags = {
    Name = "Anime"
  }
}
