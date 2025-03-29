resource "aws_iam_policy" "read_only_ecr_access" {
  name = "read-only-ecr-access"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
          Effect = "Allow",
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetAuthorizationToken",
        ],
        Resource = "*",
      }
    ]
  })
}

resource "aws_iam_role" "ecr_access" {
  name = "ecr-access"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecr.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecr_access_attachment" {
  role       = aws_iam_role.ecr_access.name
  policy_arn = aws_iam_policy.read_only_ecr_access.arn
}
