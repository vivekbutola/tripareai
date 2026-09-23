# Tripare AI Assignment

## Architecture

This project provisions the following AWS infrastructure using Terraform:

Internet
   |
   v
Application Load Balancer (ALB)
   |
   v
ECS Fargate Service
   |
   v
RDS MySQL (Private)

The RDS instance is deployed in private subnets and is only accessible from the ECS service security group.

---

## Terraform Structure

infra/
├── modules/
│   ├── network/
│   ├── ecs/
│   └── rds/
│
└── envs/
    ├── dev/
    └── prod/

### Modules

#### Network Module

Creates:

- VPC
- Internet Gateway
- NAT Gateway
- Public Subnets
- Private Subnets
- Route Tables

#### ECS Module

Creates:

- ALB
- Target Group
- Listener
- ECS Cluster
- ECS Task Definition
- ECS Service
- ECS Security Groups
- CloudWatch Log Group

#### RDS Module

Creates:

- MySQL RDS Instance
- DB Subnet Group
- RDS Security Group

---

## Environment Handling

### Dev

- Smaller RDS instance
- Shorter backup retention
- Deletion protection disabled

### Prod

- Larger RDS instance
- Longer backup retention
- Deletion protection enabled

---

## Terraform Commands

### Initialize

```bash
terraform init
```

### Validate

```bash
terraform validate
```

### Plan

```bash
terraform plan -out=tfplan
```

### Show Plan

```bash
terraform show tfplan
```

### Apply

```bash
terraform apply tfplan
```

## Docker & MySQL

The repository contains a Docker Compose setup for local MySQL testing.

### Start Containers

```bash
docker compose up -d
```

### Verify

```bash
docker ps
```

### Connect to MySQL

```bash
docker exec -it tripare-mysql bash

mysql -u root -p
```

## Database Schema

Tables:

- hotel_bookings
- booking_events

Seed data is loaded automatically from:

database/init/001_schema.sql
database/init/002_seed.sql

## Assumptions

- Region: ap-south-1
- ECS Launch Type: Fargate
- Application Image: nginx:latest
- Database Engine: MySQL 8.0
- ALB exposed publicly
- RDS accessible only from ECS Security Group

## Deliverables

- Terraform modules
- Dev environment
- Prod environment
- ECS/Fargate deployment
- RDS deployment
- Docker Compose setup
- Database schema and seed data
