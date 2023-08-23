module "cognito" {
  source = "../../../modules/cognito"

  pool_prod     = "customer-auth-pool"
  pool_dev      = "customer-auth-pool-dev"
  pool_sb       = "customer-auth-pool-sb"
  pool_test     = "customer-auth-pool-test"
  pool_training = "customer-auth-pool-training"

  sns_topic_name         = "Production-server-monitoring"
  app-client-config-name = "server-side-client"
}
