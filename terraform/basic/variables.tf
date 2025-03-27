variable "filename" {
  default = "file.txt"
  type = string
  description = "The name of the file to create"
}

variable "content" {
  default = "We love pets!"
}

variable "file_permission" {
  default = "0700"
}

variable "prefix" {
  default = "Mrs"
}

variable "separator" {
  default = "."
}

variable "length" {
  default = "1"
}

variable "regions" {
  default = ["us-west-1", "us-west-2"]
  type = list(string)
  # var.regions[0] is us-west-1
}

variable config {
  default = {
    key1 = "value1"
    key2 = "value2"
  }
  type = map(string)
  # var.config["key1"] is value1
}

# variable bella {
#   type = object({
#     name = string
#     age = number
#     food = list(string)
#     favorite_pet = bool
#     week = tuple([string, number])
#   })
# }
