resource "aws_ecs_service" "service_1" {
  name            = "viz-ai-service-1"
  cluster         = aws_ecs_cluster.ecs_cluster_1.id
  task_definition = aws_ecs_task_definition.viz_ai_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets = [
      aws_subnet.private_1.id,
      aws_subnet.private_2.id,
      aws_subnet.private_3.id
    ]

    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }
}