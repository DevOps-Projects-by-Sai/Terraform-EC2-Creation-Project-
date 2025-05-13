provider "aws" {
    region = "eu-north-1"

}

provider "vault" {
  address = "http://127.0.0.1:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "3cd8d27a-198b-f272-cfb4-d177118ae2e0"
      secret_id = "5acea332-19ec-d641-f7fd-b4276eb6ef57"
    }
  }
}


data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test_secret"
}



resource "aws_instance" "example" {
    ami = "ami-0c1ac8a41498c1a9c"
    instance_type = "t3.micro"

    tags = {
      name = "test"
      secret = data.vault_kv_secret_v2.example.data["username"]
    }

}
