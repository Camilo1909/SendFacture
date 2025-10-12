# ============================================
# VERSIONES Y PROVIDERS
# ============================================

# Versión mínima de Terraform
terraform {
  required_version = ">= 1.6.0"

  # Providers requeridos
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

# Configuración del provider AWS
provider "aws" {
  region = var.aws_region 

  # Tags por defecto para TODOS los recursos
  default_tags {
    tags = {
      Project     = "SendInvoice"
      ManagedBy   = "Terraform"
      Environment = var.environment
      Owner       = "DevOps-Juan Camilo"
    }
  }
}