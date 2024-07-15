Here we will outline the operational instructions for the project. This will include the steps required to deploy the application, manage the infrastructure, and troubleshoot common issues.

🖥️ Deployment Instructions 🖥️
CI/CD Pipeline:
1. Push changes to the main branch in the GitHub repository.
2. GitHub Actions will trigger the CI/CD pipeline.
3. The pipeline will build the application, run tests, and deploy the application to the staging environment.
4. Automated tests will be run against the staging environment.
5. If tests pass, the application will be deployed to the production environment.

Manual Deployment:
1. Clone the GitHub repository to your local machine.
2. Navigate to the project directory.
3. Run the following commands:
   ```
   terraform init
   terraform plan
   terraform apply
   ```
4. Provide the required input variables when prompted.
5. The infrastructure will be provisioned on AWS.

🔧 Infrastructure Management 🔧
State Management:
1. Store the Terraform state file in an S3 bucket.
2. Enable state locking using DynamoDB to prevent concurrent modifications.

Scaling:
1. Use AWS Auto Scaling to automatically adjust the number of EC2 instances based on traffic.

Monitoring:
1. Set up CloudWatch alarms to monitor key metrics such as CPU utilization, memory usage, and request latency.
2. Use AWS CloudTrail to log API calls for auditing and compliance.

🛠️ Troubleshooting Common Issues 🛠️
Issue: Application is unresponsive.
Solution:
1. Check the CloudWatch for any abnormal metrics.
2. Check AWS Fargate logs for any errors.
3. Check the security group settings to ensure the correct ports are open.

Issue: Terraform apply fails.
Solution:
1. Check the Terraform plan output for any errors.
2. Verify the AWS credentials and permissions.
3. Check the Terraform state file for any corruption.

