module "jenkins_ecr_build_terraform_latest_repository" {
  source           = "./tdr-terraform-modules/ecr"
  name             = "jenkins-build-terraform-latest"
  image_source_url = "https://github.com/nationalarchives/tdr-jenkins/blob/master/docker/terraform-latest/Dockerfile"
  common_tags      = local.common_tags
  policy_name      = "jenkins_policy"
  policy_variables = { role_arn = module.jenkins_build_terraform_latest_execution_role.role.arn }
}

module "jenkins_build_terraform_latest_execution_policy" {
  source        = "./tdr-terraform-modules/iam_policy"
  name          = "TDRJenkinsBuildTerraformLatestExecutionPolicy"
  policy_string = templatefile("./tdr-terraform-modules/iam_policy/templates/jenkins_ecr_policy.json.tpl", { repository_arn = module.jenkins_ecr_build_terraform_latest_repository.repository.arn })
}

module "jenkins_build_terraform_latest_execution_role" {
  source             = "./tdr-terraform-modules/iam_role"
  assume_role_policy = templatefile("./tdr-terraform-modules/ecs/templates/ecs_assume_role_policy.json.tpl", {})
  common_tags        = local.common_tags
  name               = "TDRJenkinsBuildTerraformLatestExecutionRole"
  policy_attachments = { ecr_policy = module.jenkins_build_terraform_latest_execution_policy.policy_arn }
}
