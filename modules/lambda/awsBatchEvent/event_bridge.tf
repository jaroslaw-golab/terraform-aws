resource "aws_cloudwatch_event_rule" "event_rule" {
  name          = "batch"
  description   = "EventRule"
  event_pattern = <<PATTERN
{
  "source": ["aws.batch"],
  "detail-type": ["Batch Job State Change"]
}
PATTERN
}

resource "aws_cloudwatch_event_target" "event_target" {
  rule      = aws_cloudwatch_event_rule.event_rule.name
  arn       = aws_lambda_function.default.arn
  target_id = "batch"
}

resource "aws_lambda_permission" "permission" {
  statement_id  = "AllowExecutionFromCloudWatchEvents"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.default.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.event_rule.arn
}
