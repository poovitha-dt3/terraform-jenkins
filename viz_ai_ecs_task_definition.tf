resource "aws_ecs_task_definition" "viz_ai_task" {
  family                   = "viz-ai-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  cpu    = "512"
  memory = "1024"

  execution_role_arn = aws_iam_role.ecs_execution_role.arn
  task_role_arn      = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([
    {
      name      = "viz-ai-container"
      image     = "nginx:latest"
      essential = true
      
      cpu    = 512
      memory = 1024

      portMappings = [
        {
          containerPort = 5000
          hostPort      = 5000
          protocol      = "tcp"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs_logs.name
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = "ecs"
        }
      }

      healthCheck = {
        command     = ["CMD-SHELL", "curl -f http://localhost/ || exit 1"]
        interval    = 30
        timeout     = 5
        retries     = 3
        startPeriod = 60
      }
    }
  ])
}

# CloudWatch Log Group for ECS task logs
resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/viz-ai-task"
  retention_in_days = 7

  tags = {
    Name    = "viz-ai-ecs-logs"
    Project = var.project_name
  }
}