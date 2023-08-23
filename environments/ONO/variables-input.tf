variable "remote_state" {
  default = {
    bucket   = {}
    region   = {}
    key_base = {}
  }
}
variable "region" {
  default = "us-east-1"
}
