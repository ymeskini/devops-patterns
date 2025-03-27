resource "local_file" "pet" {
  filename = each.value
  for_each = toset(var.filename)
  content = "This is a ${each.value} file"
}


variable "filename" {
  type    = list(string)
  default = [
    "/root/pets.txt",
    "/root/dogs.txt",
    "/root/cats.txt"
  ]
}
