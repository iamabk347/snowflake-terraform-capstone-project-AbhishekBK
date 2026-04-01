# Snowflake Terraform Capstone Project - Abhishek BK

## Project Overview

This project is built to automate Snowflake infrastructure using Terraform.

Instead of manually creating warehouses, databases, schemas, roles, users, and permissions in Snowflake, everything is handled through Infrastructure as Code (IaC). This makes the setup consistent, scalable, and much easier to manage.

## Objectives

* Automate Snowflake resource provisioning using Terraform
* Implement role-based access control (RBAC)
* Build a modular and reusable Terraform structure
* Keep the setup scalable and easy to maintain

## Architecture

The project is structured in a modular way so that each component is handled separately and cleanly.

snowflake-capstone/
│
├── backend/                  # Remote state setup (S3)
├── modules/
│   ├── warehouse/            # Warehouse provisioning
│   ├── database/             # Database and schema provisioning
│   ├── role/                 # Role creation
│   ├── user/                 # User creation
│   ├── grant/                # Access control and permissions
│
├── main.tf                   # Orchestration layer
├── provider.tf               # Snowflake connection config
├── variables.tf              # Input variables
├── terraform.auto.tfvars.example  # Sample config (no secrets)

## Technologies Used

* Terraform
* Snowflake
* AWS S3 (for remote Terraform state)

## Resources Provisioned

### Warehouses

* COMPUTE_WH_CUSTOM
* ANALYTICS_WH

### Databases

* HR_DB
* SALES_DB

### Schemas

HR_DB:

* RAW
* CURATED

SALES_DB:

* RAW
* CURATED
* ANALYTICS

## Role-Based Access Control (RBAC)

### Roles

* SYSADMIN_CUSTOM
* DATA_ENGINEER
* DATA_ANALYST

### Users

* DATA_ENGINEER_USER
* DATA_ANALYST_USER

### Role Assignments

* DATA_ENGINEER_USER → DATA_ENGINEER
* DATA_ANALYST_USER → DATA_ANALYST

## Permissions

### Warehouse Access

All roles are given USAGE on COMPUTE_WH_CUSTOM.

### Database Access

DATA_ENGINEER has USAGE on:

* HR_DB
* SALES_DB

### Schema Access

DATA_ENGINEER has USAGE on:

* HR_DB.RAW
* SALES_DB.RAW

## Dynamic Resource Creation

The project uses for_each to dynamically create resources like:

* Warehouses
* Databases
* Schemas
* Roles
* Users
* Grants

This avoids repetition and makes the code scalable.

## State Management

Terraform state is stored remotely in AWS S3.

This helps with:

* keeping state consistent
* avoiding local conflicts
* making the setup closer to real-world usage

## Security and Best Practices

* No credentials are hardcoded
* Sensitive values are handled through variables
* The project is fully modular
* Naming is consistent and clean
* Each responsibility is separated into its own module

## Configuration

This project does not store real credentials in the repository.

A sample file is provided:

terraform.auto.tfvars.example

To run the project:

1. Create a new file:
   terraform.auto.tfvars

2. Copy the contents from the example file

3. Replace the placeholder values with your actual Snowflake credentials

This keeps the project secure while still making it easy to use.

## Execution Steps

Initialize Terraform:

terraform fmt
terraform init

Validate configuration:
terraform validate

Preview changes:
terraform plan

Apply changes:
terraform apply

## Conclusion

This project shows how Terraform can be used to manage Snowflake infrastructure in a clean, scalable, and secure way.

The focus was on modular design, RBAC implementation, and following best practices that would apply in a real-world setup.
