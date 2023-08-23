
resource "aws_lb_listener_rule" "verify_lb_rules_sb" {
  listener_arn = var.listener_arn
  priority     = 3
  tags         = {}
  tags_all     = {}
  action {
    
    target_group_arn = aws_lb_target_group.verify-sb.arn
    type             = "forward"
  }
  condition {
    host_header {
      values = ["verify-${var.project}-sb.beaconcure.com", "www.verify-${var.project}-sb.beaconcure.com"]
    }
  }
}

resource "aws_lb_listener_rule" "verify_lb_rules_tr" {
  listener_arn = var.listener_arn
  priority     = 4
  tags         = {}
  tags_all     = {}
  action {
    
    target_group_arn = aws_lb_target_group.verify-tr.arn
    type             = "forward"
  }
  condition {
    host_header {
      values = ["verify-${var.project}-training.beaconcure.com", "www.verify-${var.project}-training.beaconcure.com"]
    }
  }
}

