resource "aws_iam_user" "admin-user" {
  name = "Abdoullah"
  tags = {
    Description = "Technical Team Lead"
  }
}

resource "aws_iam_policy" "adminUser" {
  name = "AdminUsers"
  policy = <<EOF
   {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "*",
        "Resource": "*"
      }
    ]
  }
  EOF
  # or file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "abdoullah-admin-access" {
  user = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.adminUser.arn
}


resource "aws_s3_bucket" "finance" {
  bucket = "finance-20250101"
  tags = {
    Description = "Finance Team"
  }
}

resource "aws_s3_bucket_object" "finance-2024" {
  content = file("/root/finance-2024.csv")
  key = "finance-2024.csv"
  bucket = aws_s3_bucket.finance.id
}

data "aws_iam_group" "finance-data" {
  group_name = "finance-analysts"
}

resource "aws_s3_bucket_policy" "finance-policy" {
  bucket = aws_s3_bucket.finance.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.finance.id}/*",
      "Principal": {
        "AWS": [
          "${data.aws_iam_group.finance-data.arn}"
        ]
      }
    }
  ]
}
EOF
}
