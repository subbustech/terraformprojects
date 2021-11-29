resource "aws_codepipeline" "orchestrator_pipeline" {
  name     = "orchestrator-pipeline"
  role_arn = aws_iam_role.orchestrator_codepipeline_role.arn
  tags = {
    Environment = var.env
  }

  artifact_store {
    location = var.artifacts_bucket_name
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      category = "Source"
      configuration = {
        "BranchName" = var.orchestrator_project_repository_branch
        # "PollForSourceChanges" = "false"
        "RepositoryName" = var.orchestrator_project_repository_name
      }
      input_artifacts = []
      name            = "Source"
      output_artifacts = [
        "SourceArtifact",
      ]
      owner     = "AWS"
      provider  = "CodeCommit"
      run_order = 1
      version   = "1"
    }
  }
  stage {
    name = "Build"

    action {
      category = "Build"
      configuration = {
        "EnvironmentVariables" = jsonencode(
          [
            {
              name  = "environment"
              type  = "PLAINTEXT"
              value = var.env
            },
            {
              name  = "AWS_DEFAULT_REGION"
              type  = "PLAINTEXT"
              value = var.aws_region
            },
            {
              name  = "AWS_ACCOUNT_ID"
              type  = "PARAMETER_STORE"
              value = "ACCOUNT_ID"
            },
            {
              name  = "IMAGE_REPO_NAME"
              type  = "PLAINTEXT"
              value = "orchestrator"
            },
            {
              name  = "IMAGE_TAG"
              type  = "PLAINTEXT"
              value = "latest"
            },
            {
              name  = "CONTAINER_NAME"
              type  = "PLAINTEXT"
              value = "orchestratorContainer"
            },
          ]
        )
        "ProjectName" = aws_codebuild_project.orchestratorCodeBuild.name
      }
      input_artifacts = [
        "SourceArtifact",
      ]
      name = "Build"
      output_artifacts = [
        "BuildArtifact",
      ]
      owner     = "AWS"
      provider  = "CodeBuild"
      run_order = 1
      version   = "1"
    }
  }
  stage {
    name = "Deploy"

    action {
      category = "Deploy"
      configuration = {
        ApplicationName     = aws_codedeploy_app.orchestratorcodedeployapp.name                                           // This should be name, not id
        DeploymentGroupName = aws_codedeploy_deployment_group.orchestratorcodedeploydeploymentgroup.deployment_group_name // this should be deployment_group_name, not id
      }
      input_artifacts = [
        "BuildArtifact",
      ]
      name             = "Deploy"
      output_artifacts = []
      owner            = "AWS"
      provider         = "CodeDeploy"
      run_order        = 1
      version          = "1"
    }
  }
}
