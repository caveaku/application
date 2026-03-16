variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "myapp"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "az_count" {
  description = "Number of availability zones"
  type        = number
  default     = 2
}

variable "postgres_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "14.12"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Maximum allocated storage in GB for autoscaling"
  type        = number
  default     = 100
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "myappdb"
}

variable "master_username" {
  description = "Master username"
  type        = string
  default     = "dbadmin"
}

variable "backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
  default     = 7
}

variable "performance_insights_enabled" {
  description = "Enable Performance Insights"
  type        = bool
  default     = false
}

variable "environment_config" {
  description = "Environment specific configurations"
  type = object({
    dev = object({
      instance_class               = string
      allocated_storage           = number
      backup_retention_period     = number
      deletion_protection         = bool
      performance_insights_enabled = bool
    })
    prod = object({
      instance_class               = string
      allocated_storage           = number
      backup_retention_period     = number
      deletion_protection         = bool
      performance_insights_enabled = bool
    })
  })
  default = {
    dev = {
      instance_class               = "db.t3.micro"
      allocated_storage           = 20
      backup_retention_period     = 7
      deletion_protection         = false
      performance_insights_enabled = false
    }
    prod = {
      instance_class               = "db.t3.medium"
      allocated_storage           = 100
      backup_retention_period     = 30
      deletion_protection         = true
      performance_insights_enabled = true
    }
  }
}
