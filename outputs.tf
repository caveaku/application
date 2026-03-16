output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.postgresql.address
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.postgresql.port
}

output "rds_database_name" {
  description = "RDS database name"
  value       = aws_db_instance.postgresql.db_name
}

output "rds_master_username" {
  description = "RDS master username"
  value       = aws_db_instance.postgresql.username
  sensitive   = true
}

output "rds_master_password" {
  description = "RDS master password"
  value       = random_password.master_password.result
  sensitive   = true
}

output "rds_secretsmanager_arn" {
  description = "ARN of the Secrets Manager secret containing RDS credentials"
  value       = aws_secretsmanager_secret.rds_password.arn
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = aws_subnet.private[*].id
}
