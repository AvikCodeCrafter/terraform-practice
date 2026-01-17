output "ec2_public_ip" {
    value = aws_instance.my_instance[*].public_ip  # Multiple-Outputs[*]
}

output "ec2_public_dns" {
    value = aws_instance.my_instance[*].public_dns
}

output "ec2_private_ip" {
    value = aws_instance.my_instance[*].private_ip
}

output "eip_public_dns" {
  value = aws_eip.my_instance_eip[*].public_dns
}

output "eip_public_ip" {
  value = aws_eip.my_instance_eip[*].public_ip
  description = "Public Elastic IP of Ec2 Instance"
}

# Output for_each

# output "ec2_pub_ip" {
#  value = [
#    for instance in aws_aws_instance.my_instance : my_instance.public_ip
#  ]
# }