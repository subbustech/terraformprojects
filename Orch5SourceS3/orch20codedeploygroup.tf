resource "aws_codedeploy_deployment_group" "orchestratorcodedeploydeploymentgroup" {
  app_name              = aws_codedeploy_app.orchestratorcodedeployapp.name
  deployment_group_name = "orchestratorcodedeploydeploymentgroup"
  service_role_arn      = aws_iam_role.orchestrator-codedeploy-role.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "EC2 Demo1"
    }
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "EC2 Demo2"
    }
  }

  provisioner "local-exec" {
        command = "aws deploy create-deployment --application-name orchestratorcodedeployapp --deployment-config-name CodeDeployDefault.OneAtATime --deployment-group-name orchestratorcodedeploydeploymentgroup --s3-location bucket=orchestrator-cicd-artifacts-bucket,bundleType=zip,key=somename"
  }
}
