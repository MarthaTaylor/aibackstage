module "hello" {
  source = "../../modules/secure-service"

  name  = "hello-dev"
  image = "nginx:1.27-alpine"
}