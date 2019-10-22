data "archive_file" "terraform_function" {
  type = "zip"
  source_dir = "./sample"
  output_path = "upload/terraform_function.zip"
}

resource "aws_lambda_function" "sample_function" {
  filename = "${data.archive_file.terraform_function.output_path}"
  function_name = "lambda_handler"
  role = "${aws_iam_role.iam_for_lambda.arn}"
  handler = "terraform_function.lambda_handler"
  source_code_hash = "${data.archive_file.terraform_function.output_base64sha256}"
  runtime = "ruby2.5"
  memory_size = 128
  timeout = 30
}
