resource "aws_codedeploy_app" "orchestratorcodedeployapp" {
  compute_platform = "Server"
  name             = "orchestratorcodedeployapp"
}
