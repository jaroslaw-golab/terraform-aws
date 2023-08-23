module "org-start-stop-lambda" {
    source = "../../../modules/lambda/start_env"
    
    customer = "org"
   # function_name = "${customer}-start-stop-lambda-function"
    
    
}