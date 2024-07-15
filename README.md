<h2 align="center"> PRISM INFRASTRUCTURE DOCUMENTATION </h2>

---
<p align="center"> Prism aims to be a one stop shop solution for Version 1 exployees who want to access Talentguard, Call-Out, Small Improvements and Hall of Fame. This documentation provides an overview of the Prism infrastructure and how it is built and maintained. </p>

## 📝 Table of Contents 
- [Introduction & Problem Statement](#problem_statement)
- [Architecture Overview](#architecture)
- [Keys & Secrets](#keys_secrets)
- [Deployment Process](#deployment)
- [Monitoring & Logging](#monitoring)
- [Security & Compliance](#security)
- [Additional Resources](#resources)
- [Conclusion](#conclusion)
- [Acknowledgements](#acknowledgements)

 <a name = "problem_statement"><h3 align="center">📃 Introducation & Problem Statement 📃</h3></a>

This documenation is intended to provide a high-level overview of the Prism infrastructure. It is intended to be a living document and will be updated as the infrastructure evolves.
Prism is a platform that is an amalgamation of multiple Version 1 intranet services that includes Talentguard, Call-Out, Small Improvements and Hall of Fame. 

Currently, these are served as separate services and are not integrated with each other. The goal of Prism is to provide a unified platform that integrates all these services and provides a seamless experience to the users.

💻 Architecture Overview 💻 <a name ="architecture"></a>

The Prism infrastructure is hosted on AWS and is built using the following services:
- AWS Fargate: For running the Prism services in containers without having to manage the underlying infrastructure.

You can read more about our infratructure setup [here.](project_documentation/infrastructure.md)

🔐 Keys & Secrets 🔐 <a name ="keys_secrets"></a>

The Prism infrastructure uses the following keys and secrets:
- AWS_ACCESS_KEY_ID: The access key for the AWS account.
- AWS_SECRET_ACCESS_KEY: The secret key for the AWS account.
These are hosted in a hashicorp vault and are injected into the Prism infrastructure at runtime via our Terraform scripts.

- VAULT_TOKEN: The token for accessing the hashicorp vault.
This secret is hosted using Github Actions secrets and is injected into the Prism infrastructure at runtime via a Github Action workflow.
You can read more about our best practices for managing keys and secrets [here.](project_documentation/best_practices.md)

🔧 Deployment Process 🔧 <a name ="deployment"></a>

Prism uses Github Actions for CI/CD. The deployment process is as follows:
- A developer completes a pull request and merges it into the main branch.
- A Github Action workflow is triggered that builds the Prism services and deploys them to the AWS Fargate cluster.
You can read more about our CI/CD process [here.](project_documentation/cicd_pipeline.md)

📈 Monitoring & Logging 📈 <a name ="monitoring"></a>
 
Prism uses AWS CloudWatch for monitoring and logging. The logs are stored in CloudWatch logs and can be accessed via the AWS console.
You can read more about our monitoring and logging setup [here.](project_documentation/maintenance.md)

🪪 Security & Compliance 🪪 <a name ="security"></a>
Prism follows AWS best practices for security and compliance. The infrastructure is secured using IAM roles and policies, and access to the infrastructure is restricted to authorized users.
You can read more about our security practices [here.](project_documentation/security.md) and our compliance practices [here.](/project_documentation/compliance_governance.md)

📚 Additional Resources 📚 <a name ="resources"></a>
For more information on the Prism infrastructure, please refer to the following resources:
- Prism Github repository:
- Prism infrastructure repository:
- Prism documentation: 

📝 Conclusion 📝 <a name ="conclusion"></a>
This document has provided an overview of the Prism infrastructure. For more information, please refer to the additional resources provided above. If you have any questions or feedback, please reach out to the Prism team. Thank you for reading!

🙏 Acknowledgements 🙏 <a name ="acknowledgements"></a>
We would like to thank everyone at Version 1 who has had a hand in making the digital skills academy the best that it can be. From Workjuggle, making our "power skills" weeks so much fun and giving us the confidence we needed to present to Chester from We Are Tech who's guidance and feedback was invaluable. We would also like to thank our mentors, who have been so supportive and encouraging throughout the process. Finally, we would like to thank the Version 1 team for giving us the opportunity to work on such an exciting project and for providing us with the resources and support we needed to succeed. Thank you! 


