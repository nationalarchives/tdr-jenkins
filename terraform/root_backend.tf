terraform {
  backend "s3" {
    bucket         = "tdr-terraform-state-jenkins"
    key            = "jenkins-terraform-state"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "tdr-terraform-state-lock-jenkins"
  }
}
