resource "aws_sqs_queue" "count_queue" {
    count = length(var.names)
    name = element(var.names, count.index)

}

variable "names" {
  type = list(string)
  description = "sqs names"
  default = [ "first", "second", "third" ]
}