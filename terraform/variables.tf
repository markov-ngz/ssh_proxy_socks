variable "tags" {
  type        = map(string)
  description = "resource's tag"
}

variable "ami_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "key_path" {
  type = string
}

variable "public_ip" {
  description = "public IP to restrict ssh or TCP connexion to my computer"
  type        = string
  sensitive   = true
}