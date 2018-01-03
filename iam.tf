# IAM role that allows the flow logs to be written to CloudWatch
resource "aws_iam_role" "log_role" {
  name = "${var.environment}_log_role"

  assume_role_policy = "${data.aws_iam_policy_document.iam_log_assume_role_policy.json}"
}

# IAM role policy allows the flow logs to be written to CloudWatch
resource "aws_iam_role_policy" "log_policy" {
  name = "${var.environment}_log_policy"
  role = "${aws_iam_role.log_role.id}"

  policy = "${data.aws_iam_policy_document.iam__log_role_policy_document.json}"
}

# IAM policy document that allows the flow logs to be written to CloudWatch
data "aws_iam_policy_document" "iam__log_role_policy_document" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams"
    ]

    resources = [
      "arn:aws:logs:*:*:*"
    ]
  }
}

# Alows flow logs to assume a role
data "aws_iam_policy_document" "iam_log_assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type        = "Service"
      identifiers = [
        "vpc-flow-logs.amazonaws.com"
      ]
    }
  }
}