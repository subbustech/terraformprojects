resource "aws_codecommit_repository" "test" {
  repository_name = var.orchestrator_project_repository_name
  description     = "Orchestrator Code Repository"
  default_branch  = var.orchestrator_project_repository_branch
}
