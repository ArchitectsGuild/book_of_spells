resource "aws_alb" "application_load_balancer" {
    name               = "ecs-workshop-lb"
    load_balancer_type = "application"
    subnets = [
        "${aws_default_subnet.default_subnet_a.id}",
        "${aws_default_subnet.default_subnet_b.id}",
        "${aws_default_subnet.default_subnet_c.id}"
    ]
    
    security_groups = ["${aws_security_group.load_balancer_security_group.id}"]
}

resource "aws_security_group" "load_balancer_security_group" {
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_lb_target_group" "target_group" {
    name        = "ecs-workshop-target-group"
    port        = 80
    protocol    = "HTTP"
    target_type = "ip"
    vpc_id      = "${aws_default_vpc.default_vpc.id}"
    health_check {
        matcher = "200,301,302"
        path = "/"
    }
}

resource "aws_lb_listener" "listener" {
    load_balancer_arn = "${aws_alb.application_load_balancer.arn}"
    port              = "80"
    protocol          = "HTTP"
    default_action {
        type             = "forward"
        target_group_arn = "${aws_lb_target_group.target_group.arn}"
    }
}

# Output the DNS name of the ALB
output "alb_dns_name" {
  value = aws_alb.application_load_balancer.dns_name
  description = "The DNS name of the application load balancer"
}