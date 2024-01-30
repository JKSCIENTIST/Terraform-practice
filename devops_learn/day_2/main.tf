# resource "aws_instance" "day2" {
#   ami = "ami-03f4878755434977f"
#   instance_type = "t2.micro"
#   key_name = "devops"
#   vpc_security_group_ids = [aws_security_group.demo.id]
#   user_data = <<-EOF
#               #!/bin/bash
#               echo 'Really Nigga<head><meta http-equiv="refresh" content="2; url=https://shattereddisk.github.io/rickroll/rickroll.mp4" /></head>' > index.html
#               nohup busybox httpd -f -p 80 &
#               EOF
#   user_data_replace_on_change = true
#   tags = {Name = "DevOps"}

#   // 

# }

resource "aws_launch_configuration" "asg_config" {
  image_id = "ami-06aa3f7caf3a30282"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.demo.id]
  user_data = <<-EOF
              #!/bin/bash
              echo 'Really Nigga<head><meta http-equiv="refresh" content="2; url=https://shattereddisk.github.io/rickroll/rickroll.mp4" /></head>' > index.html
              nohup busybox httpd -f -p 80 &
              EOF
  

}
resource "aws_autoscaling_group" "asg" {
  launch_configuration = aws_launch_configuration.asg_config.name
  vpc_zone_identifier = data.aws_subnets.default.ids
  health_check_type = "ELB"
  target_group_arns = [aws_lb_target_group.dev_lb_target_group.arn]
  min_size = 2
  max_size = 5

  tag {
    key = "abc"
    value = "asg-eg"
    propagate_at_launch = true
  }
}

resource "aws_lb_listener_rule" "listener_rule_dev" {
  listener_arn = aws_lb_listener.dev_lb_listener_http.arn
  priority = 100
  condition {
    path_pattern {
      values = ["*"]
    }
  }
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.dev_lb_target_group.arn
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_lb" "dev_alb" {
  name = "lohith-aksha-mass"
  load_balancer_type = "application"
  subnets = data.aws_subnets.default.ids
  security_groups = [aws_security_group.demo.id]
}

resource "aws_lb_listener" "dev_lb_listener_http" {
    load_balancer_arn = aws_lb.dev_alb.arn
    port = 80
    protocol = "HTTP"

    default_action {
        type = "fixed-response"
      fixed_response {
        content_type = "text/plain"
        message_body = "404: page not found"
        status_code = 404
      }
    }
  
}

resource "aws_lb_target_group" "dev_lb_target_group" {
  name = "lb-target-grp"
  port = 80
  protocol = "HTTP"
  vpc_id = data.aws_vpc.default.id
  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 15
    timeout = 3
    unhealthy_threshold = 2
    healthy_threshold = 2

  }
}



resource "aws_security_group" "demo" {
    name = "AWS_SG_8080"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

# output "Configs" {
#   value = aws_instance.day2.public_ip
#   description = "aws_instance.day2.public_ip"
# }


output "alb_dns_name" {
  value = aws_lb.dev_alb.dns_name
  description = "niggaaa yeahhhhhhhh!!"
}