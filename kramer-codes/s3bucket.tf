#################################
# S3 BUCKET                     #
#################################
# The bucket.tf file contains the resource blocks for creating and configuring the AWS S3 bucket.

# The aws_s3_bucket resource creates an S3 bucket with the specified bucket name.
resource "aws_s3_bucket" "website-bucket" {
  bucket = var.aws_bucket_name
  # It also configures the bucket for static website hosting, specifying the index and error documents.
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

# The aws_s3_bucket_cors_configuration resource sets up Cross-Origin Resource Sharing (CORS) rules for the bucket.
resource "aws_s3_bucket_cors_configuration" "website-cors" {
  bucket = aws_s3_bucket.website-bucket.id  
  # Sets the Cors Rule object to what is allowable and for how long of a duration
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }  
}

# The aws_s3_bucket_acl resource sets the bucket's Access Control List (ACL) to allow public read access.
resource "aws_s3_bucket_acl" "website-acl" {
  bucket = aws_s3_bucket.website-bucket.id
  acl    = "public-read"
  # The dependency object in the array must be entirely built and available before this resource object should be built.
  depends_on = [aws_s3_bucket_ownership_controls.website-bucket-acl-ownership]
}

# The aws_s3_bucket_ownership_controls resource enables ownership controls for the bucket.
resource "aws_s3_bucket_ownership_controls" "website-bucket-acl-ownership" {
  bucket = aws_s3_bucket.website-bucket.id
  # Objects uploaded to the bucket change ownership to the bucket owner if the objects are uploaded with the bucket-owner-full-control canned ACL.
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
  # The dependency object in the array must be entirely built and available before this resource object should be built.
  depends_on = [aws_s3_bucket_public_access_block.website-public-block]
}

# The aws_s3_bucket_public_access_block resource configures public access block settings for the bucket.
resource "aws_s3_bucket_public_access_block" "website-public-block" {
  bucket = aws_s3_bucket.website-bucket.id

  # AWS by default blocks public access. Adjusts to allow it.
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# The aws_s3_bucket_policy resource attaches a bucket policy that allows public read access.
resource "aws_s3_bucket_policy" "website-bucket-policy" {
  bucket = aws_s3_bucket.website-bucket.id

  # The policy itself which allows you to dictate bucket security config on creation.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Principal = "*"
        Action = [
          "s3:*",
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.aws_bucket_name}",
          "arn:aws:s3:::${var.aws_bucket_name}/*"
        ]
      },
      {
        Sid = "PublicReadGetObject"
        Principal = "*"
        Action = [
          "s3:GetObject",
        ]
        Effect   = "Allow"
        Resource = [
          "arn:aws:s3:::${var.aws_bucket_name}",
          "arn:aws:s3:::${var.aws_bucket_name}/*"
        ]
      },
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.website-public-block]
}

# The aws_s3_bucket_object resources upload the index.html and styles.css files to the bucket.
resource "aws_s3_bucket_object" "index_html" {
  bucket = aws_s3_bucket.website-bucket.id
  # What to call file in the bucket.
  key    = "index.html"
  # Path to file locally that you want to push.
  source = "index.html"
  # Telling it to treat it like an html file (or it downloads by default)
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "styles_css" {
  bucket = aws_s3_bucket.website-bucket.id
  key    = "styles.css"
  source = "styles.css"
  content_type = "text/css"
}
