# Snowflake Terraform Capstone Project

## Project Overview

This project implements Infrastructure as Code (IaC) using Terraform to provision and manage Snowflake resources in a scalable, consistent, and secure manner.

The solution automates the creation of warehouses, databases, schemas, roles, users, and access controls, eliminating manual configuration and reducing operational risks.

## Objectives

- Automate Snowflake resource provisioning using Terraform  
- Implement role-based access control (RBAC)  
- Design modular and reusable Terraform components  
- Ensure scalability and maintainability of infrastructure  

## Architecture

The project follows a modular Terraform structure:

snowflake-capstone/
│
├── backend/                  # Remote state configuration (S3)
├── modules/
│   ├── warehouse/            # Warehouse provisioning
│   ├── database/             # Database and schema provisioning
│   ├── role/                 # Role creation
│   ├── user/                 # User creation
│   ├── grant/                # Access control and permissions
│
├── main.tf                   # Root module configuration
├── provider.tf               # Snowflake provider configuration
├── variables.tf              # Input variables
├── terraform.auto.tfvars     # Environment configuration

## Technologies Used

- Terraform  
- Snowflake  
- AWS S3 (Remote backend for Terraform state)

## Resources Provisioned

### Warehouses
- COMPUTE_WH_CUSTOM  
- ANALYTICS_WH  

### Databases
- HR_DB  
- SALES_DB  

### Schemas

HR_DB:
- RAW  
- CURATED  

SALES_DB:
- RAW  
- CURATED  
- ANALYTICS  

## Role-Based Access Control (RBAC)

### Roles
- SYSADMIN_CUSTOM  
- DATA_ENGINEER  
- DATA_ANALYST  

### Users
- DATA_ENGINEER_USER  
- DATA_ANALYST_USER  

### Role Assignments
- DATA_ENGINEER_USER → DATA_ENGINEER  
- DATA_ANALYST_USER → DATA_ANALYST  

## Permissions

### Warehouse Access
All roles are granted USAGE on COMPUTE_WH_CUSTOM.

### Database Access
DATA_ENGINEER is granted USAGE on:
- HR_DB  
- SALES_DB  

### Schema Access
DATA_ENGINEER is granted USAGE on:
- HR_DB.RAW  
- SALES_DB.RAW  

## Dynamic Resource Creation

Terraform dynamic constructs such as for_each are used to create:

- Warehouses  
- Databases  
- Schemas  
- Roles  
- Users  
- Grants  

This approach ensures scalability and reduces code duplication.

## State Management

Terraform remote backend is configured using AWS S3 to:

- Store state centrally  
- Maintain consistency across executions  

## Security and Best Practices

- No hardcoded credentials  
- Sensitive inputs handled through variables  
- Modular and reusable code structure  
- Clear naming conventions  
- Separation of concerns across modules  

## Execution Steps

### Initialize Terraform
terraform init

### Validate Configuration
terraform validate

### Preview Changes
terraform plan

### Apply Changes
terraform apply

## Future Enhancements

- Multi-environment support (Dev, QA, Prod)  
- Table creation and table-level permissions  
- CI/CD pipeline integration  
- Data loading simulation  
- Terraform workspaces  

## Conclusion

This project demonstrates the use of Terraform to build a scalable and secure Snowflake environment with proper access control and modular design, aligned with industry best practices.