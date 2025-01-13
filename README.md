# Terraform EC2 Implementation

This repository contains Terraform configurations for provisioning AWS EC2 instances and associated networking components. The goal is to automate the deployment of a scalable and secure infrastructure on AWS.

## Features

- **EC2 Instances**: Provision multiple EC2 instances with specified instance types, AMIs, and key pairs.
- **Networking**:
  - **VPC**: Create a Virtual Private Cloud to isolate resources.
  - **Subnets**: Define public and private subnets across multiple availability zones.
  - **Security Groups**: Implement security groups to control inbound and outbound traffic.
- **Provisioning**:
  - **User Data**: Utilize user data scripts for initial instance configuration.
  - **Key Pair Management**: Manage SSH key pairs for secure access.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v0.12 or later
- AWS account with appropriate permissions
- Configured AWS CLI or environment variables for authentication

## Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/christos-tsatsoulas/terraform-ec2.git
   cd terraform-ec2
