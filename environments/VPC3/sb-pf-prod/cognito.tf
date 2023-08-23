module "user_pool_sb" {
    source = "../../../modules/cognito"
    
    app-client-config-name = "server-side-verify"
    sns_topic_name = "Production-server-monitoring"
    pool_sb = "customer-auth-pool-sb"
    pool_training = "customer-auth-pool-training"
    sns_caller_arn = "arn:aws:iam::931929721969:role/service-role/customerauthpool-SMS-Role-new"
    sns_external_id = "2aa6b6f7-609a-4363-aadb-8352998e12f1"

}
