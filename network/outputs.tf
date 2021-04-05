output "public1_id" {
  value       = aws_subnet.public1.id
}

output "vpc_id" {
  value       = aws_vpc.iti.id
}
output vpc_cider {
  value       = aws_vpc.iti.cidr_block
}

