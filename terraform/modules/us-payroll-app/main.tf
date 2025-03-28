module "us_payroll" {
  source = "../payroll_app"
  app_region = "us-east-1"
  ami = "ami-24e140111avm"
  bucket = "flexit-payroll-alpha-us-east-1"
}
