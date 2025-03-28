module "uk_payroll" {
  source = "../payroll_app"
  app_region = "eu-west-2"
  ami = "ami-0a1b2c3d4e5f6g7h8"
  bucket = "flexit-payroll-alpha-eu-west-2"
}
