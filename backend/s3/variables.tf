variable "bucket_name" {
  description = "Nome do Bucket"
  type        = string
}

variable "sse_algorithm" {
  description = "Algoritmo para sse"
  type        = string
  default     = "AES256"
}

variable "dynamodb_name" {
  description = "Dynamodb Name"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "sa-east-1"
}
