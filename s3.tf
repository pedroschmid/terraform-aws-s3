resource "aws_s3_bucket" "this" {
  bucket = "terraform-bucket-${random_id.this.hex}"
  acl = "private"

  tags = {
    "Name" = "terraform-bucket"
  }
}

resource "aws_s3_bucket_object" "json" {
  bucket = aws_s3_bucket.this.bucket
  key = "/files/documents/countries.json"
  acl = "public-read"
  
  source = "files/countries.json"
}

resource "aws_s3_bucket_object" "jpg" {
  bucket = aws_s3_bucket.this.bucket
  key = "/files/images/demon-slayer.jpg"
  acl = "private"
  
  source = "files/demon-slayer.jpg"
}