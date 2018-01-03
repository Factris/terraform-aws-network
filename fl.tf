
# For each subnet a flow log is created
resource "aws_flow_log" "flow_log_private" {
  log_group_name = "${aws_cloudwatch_log_group.log_group.name}"
  iam_role_arn   = "${aws_iam_role.log_role.arn}"
  subnet_id      = "${aws_subnet.private.id}"
  traffic_type   = "ALL"
}

resource "aws_flow_log" "flow_log-private_failover" {
  log_group_name = "${aws_cloudwatch_log_group.log_group.name}"
  iam_role_arn   = "${aws_iam_role.log_role.arn}"
  subnet_id      = "${aws_subnet.private_failover.id}"
  traffic_type   = "ALL"
}

resource "aws_flow_log" "flow_log-private_failover_2" {
  log_group_name = "${aws_cloudwatch_log_group.log_group.name}"
  iam_role_arn   = "${aws_iam_role.log_role.arn}"
  subnet_id      = "${aws_subnet.private_failover_2.id}"
  traffic_type   = "ALL"
}

resource "aws_flow_log" "flow_log-public" {
  log_group_name = "${aws_cloudwatch_log_group.log_group.name}"
  iam_role_arn   = "${aws_iam_role.log_role.arn}"
  subnet_id      = "${aws_subnet.public.id}"
  traffic_type   = "ALL"
}

resource "aws_flow_log" "flow_log-public_failover" {
  log_group_name = "${aws_cloudwatch_log_group.log_group.name}"
  iam_role_arn   = "${aws_iam_role.log_role.arn}"
  subnet_id      = "${aws_subnet.public_failover.id}"
  traffic_type   = "ALL"
}

resource "aws_flow_log" "flow_log-public_failover_2" {
  log_group_name = "${aws_cloudwatch_log_group.log_group.name}"
  iam_role_arn   = "${aws_iam_role.log_role.arn}"
  subnet_id      = "${aws_subnet.public_failover_2.id}"
  traffic_type   = "ALL"
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = "${var.environment}_log_group"
  retention_in_days = "${var.log_retention}"
}
