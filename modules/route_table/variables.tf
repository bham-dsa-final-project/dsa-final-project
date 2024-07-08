variable "subnet_count" {
  description = "The number of public and private subnets to create"
  type        = map(number)
  default = {
    public  = 2 # Adjust the number of public subnets as needed
    private = 2 # Adjust the number of private subnets as needed hey jack!
  }
}
