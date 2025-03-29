plugin "terraform" {
  # すべてのルールを有効にする
  preset = "all"
  enabled = true
}

# AWSプラグインを設定する
plugin "aws" {
    enabled = true
    version = "0.38.0"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
    deep_check = true
}
