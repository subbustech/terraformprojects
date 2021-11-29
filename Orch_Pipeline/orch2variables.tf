# Input Variables
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}

variable "env" {
  description = "Targeted Depolyment environment"
  default     = "dev"
}

# Availability Zone 1
variable "availzone1" {
  description = "Availability Zone 1"
  default     = "us-east-1a"
}

# Availability Zone 2
variable "availzone2" {
  description = "Availability Zone 2"
  default     = "us-east-1b"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instnace Type"
  type        = string
  default     = "t3.micro"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type        = string
  default     = "terraform"
}

# AWS codecommit variables
variable "orchestrator_project_repository_name" {
  description = "Orchestrator Project Repository name to connect to"
  default     = "orchestratorrepo"
}

variable "orchestrator_project_repository_branch" {
  description = "Orchestrator Project Repository branch to connect to"
  default     = "master"
}

#AWS S3 details
variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "orchestrator-cicd-artifacts-bucket"
}

variable "orchestrator_service_name" {
  description = "Target Amazon  Service name"
  default     = "OrchestratorAppService"
}


# AWS EC2 Instance Type - List
# variable "instance_type_list" {
#   description = "EC2 Instance Type"
#   type        = list(string)
#   default     = ["t3.micro", "t3.small", "t3.large"]
# }

# AWS EC2 Instance Type - Map
# variable "instance_type_map" {
#   description = "EC2 Instance Type"
#   type        = map(string)
#   default = {
#     "dev"  = "t3.micro"
#     "qa"   = "t3.small"
#     "prod" = "t3.large"
#   }
# }
