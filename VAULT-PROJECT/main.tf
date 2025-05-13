provider "aws" {
    region = "eu-north-1"

}

provider "vault" {
  address = "http://127.0.0.1:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "3c0"        #Generate the role_id and secret_id using commands
      secret_id = "5ac"
    }
  }
}


data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test_secret"
}



resource "aws_instance" "example" {
    ami = "ami-"
    instance_type = "t3.micr"

    tags = {
      name = "test"
      secret = data.vault_kv_secret_v2.example.data["username"]
    }

}
