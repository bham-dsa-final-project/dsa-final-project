Here we will be detailing the infrastructure we have set up for the project.

🌐 Infrastructure Overview 🌐
1. Cloud Provider: Amazon Web Services (AWS).
2. Regions: eu-west-2 (London) for production.
3. Availability Zones: 2 availability zones for high availability.
4. Networking:
   - VPC: Virtual Private Cloud with CIDR block
    - Subnets: Public and private subnets in each availability zone

🔒 Security and Compliance 🔒
1. Security Groups: Restrict inbound and outbound traffic.
2. Network ACLs: Control traffic at the subnet level.
3. Encryption: Use AWS Key Management Service (KMS) for encryption.
4. Compliance: Follow AWS best practices for security and compliance.

🖥️ Compute Resources 🖥️
1. AWS Fargate: Serverless container management for running Docker containers.

🗄️ Storage and Databases 🗄️
1. Amazon RDS: Managed relational database service for MySQL.
2. Amazon S3: Object storage for static assets and file uploads.

