# Terraform & AWS: Creating a simple website with an S3 Bucket (Kramer Codes): Lecture Notes

## Intro

Hello everyone! Welcome to today's lecture on creating a simple website with Terraform and AWS S3 Bucket. We will be digging into AWS, Serverless Architecture, Terraform and Infrastructure as Code.

### What is AWS?

[What is AWS?](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fqph.fs.quoracdn.net%2Fmain-qimg-0e0ee9b2bfe396e2a6a8429b06141b98&f=1&nofb=1&ipt=b7d2ffee88b0c6871a5952b3d7687fdb3cf78da95090879b4c1a7ed7e9a0c172&ipo=images)

*   So what is AWS?
*   AWS (Amazon Web Services) is a cloud computing platform that provides a wide range of services for building and deploying applications in a scalable and cost-effective manner.
*   Accounts for the most profit of the entire Amazon company.
*   Takes up 1/3 of the cloud infrastructure market.
*   Today, we will dive into AWS serverless architecture and how to manage it using Terraform.
*   In this presentation, we will explore what AWS is, its significance for new developers, and how Terraform can help in managing AWS infrastructure efficiently.

### Understanding AWS

*   AWS solves the problem of traditional infrastructure management by offering a vast collection of services that allow developers to build, deploy, and scale applications without worrying about the underlying infrastructure.
*   Unlike a standard Express server or traditional server-based architecture, AWS provides a serverless architecture that allows developers to focus on writing code without managing servers or infrastructure.

### The Benefits to AWS

[Benefits of AWS](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.veritis.com%2Fwp-content%2Fuploads%2F2018%2F12%2Fbenefits-of-AWS-cloud-migration.jpg&f=1&nofb=1&ipt=1f4ec8856488bfd7a3e8c41f94746f2a378d9649846b0529f4d28429557ef5f3&ipo=images)

*   Scalability and Elasticity: 
  AWS enables customers to scale their infrastructure up or down based on demand. With services like Amazon EC2 Auto Scaling and Amazon RDS Scaling, customers can automatically adjust resources to handle traffic spikes or reduce costs during low-demand periods. This scalability and elasticity help businesses save costs and provide a seamless user experience.

*   Cost-Effectiveness:
  AWS follows a pay-as-you-go pricing model, allowing customers to pay only for the resources they consume. This eliminates the need for large upfront investments and enables businesses to align costs with actual usage. AWS also offers cost optimization tools and services, such as AWS Cost Explorer and AWS Budgets, to help customers monitor and optimize their cloud spending.

*   Reliability and High Availability:
  AWS operates a global infrastructure that includes multiple Availability Zones (AZs) within regions. This architecture ensures high availability and fault tolerance for applications and data. By leveraging services like Amazon S3 for storage or Amazon RDS for databases, customers can achieve durability and redundancy, reducing the risk of data loss or service disruptions.

*   Security and Compliance:
  AWS provides a secure cloud environment with robust security measures. It offers features like Identity and Access Management (IAM), Virtual Private Cloud (VPC), encryption, and DDoS protection to safeguard customer data and resources. AWS also complies with various industry standards and regulations, making it suitable for highly regulated industries like healthcare and finance.

*   Flexibility and Agility:
  AWS enables developers to choose from multiple programming languages, frameworks, and development tools. It supports both traditional and serverless architectures, allowing developers to focus on code without worrying about infrastructure management. AWS also provides DevOps services like AWS CodePipeline and AWS CodeDeploy, facilitating continuous integration and deployment.

*   Global Reach and Availability:
  AWS has a vast global footprint, with regions and edge locations spread across the world. This global presence allows customers to deploy their applications closer to end-users, reducing latency and improving performance. It also enables businesses to expand their reach globally without investing in physical infrastructure.
  
*   Ecosystem and Integration:
  AWS has a thriving ecosystem of third-party tools, services, and partner solutions that complement its offerings. This ecosystem provides customers with a wide range of options to enhance their AWS deployments, integrate with existing systems, and accelerate innovation.

### Why AWS Understanding is Crucial

*   Holds a huge moat among Cloud Providers.
*   As a new developer, understanding AWS is crucial because it is one of the most widely used cloud platforms in the industry.
*   Many organizations and companies rely on AWS for their infrastructure needs, and having AWS skills can open up various job opportunities.
*   AWS offers a rich ecosystem of services, and learning to leverage them effectively can help developers build scalable, reliable, and cost-efficient applications.
*   By understanding AWS, developers can harness the power of cloud computing and focus on solving business problems rather than dealing with infrastructure complexities.
*   It may not be AWS you want to learn, but learn about Cloud Architecture using any of the major providers.

### Introduction to Terraform

[What is Terraform?](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.devopsschool.com%2Fblog%2Fwp-content%2Fuploads%2F2022%2F02%2Fterraform-1.png&f=1&nofb=1&ipt=036b44f989b24c73d50aad159c7c24d8479a0f0b983a20ac2075f77e38f04a43&ipo=images)

*   Terraform is an open-source infrastructure as code (IaC) tool developed by HashiCorp.
*   It allows you to define and provision infrastructure resources in a declarative and version-controlled manner.
*   Terraform provides a unified workflow to manage various cloud providers, including AWS.
*   With Terraform, you can define your infrastructure using a simple and human-readable configuration language.
*   It enables you to create, update, and destroy infrastructure resources efficiently, making it a popular choice for managing AWS architecture.

### Why Terraform for AWS Architecture

[Benefits of Terraform](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fveritis.com%2Fwp-content%2Fuploads%2F2022%2F06%2Fbenefits-of-terraform.png&f=1&nofb=1&ipt=243567f6ffe4f57c3cbb4139ab8fe26e4d94e5916e1b3783fea4d07eeebac688&ipo=images)

*   Terraform offers several advantages for managing AWS architecture:
    *   Infrastructure as Code: Terraform allows you to define your infrastructure as code, making it reproducible, version-controlled, and easier to collaborate on.
    *   Resource Management: Terraform simplifies the management of AWS resources by providing a declarative way to specify desired infrastructure state.
    *   Automation and Orchestration: Terraform enables automation and orchestration of infrastructure provisioning, allowing you to easily create and manage complex AWS architectures.
    *   Multi-Cloud Support: Terraform supports multiple cloud providers, including AWS, making it flexible and enabling cross-cloud infrastructure management.

### Terraform AWS Provider and Syntax

[Terraform Syntax](./images/terraform-syntax.png)

*   The AWS provider in Terraform allows you to interact with various AWS services and resources.
*   To use the AWS provider, you need to configure your AWS credentials to authenticate with the AWS API.
*   Terraform configuration files use HashiCorp Configuration Language (HCL) syntax, which is simple and easy to understand.
*   HCL provides a concise way to define resources, variables, modules, and other Terraform constructs.

### Terraform Configuration Essentials

*   Let's explore some essential elements of Terraform configuration:
    *   Resources: Resources represent the infrastructure components you want to manage, such as AWS Lambda functions, API Gateway endpoints, S3 buckets, etc.
    *   Variables: Variables allow you to parameterize your configuration and make it reusable. They can be used to customize resource properties or values.
    *   Modules: Modules are reusable blocks of Terraform configuration that encapsulate and abstract infrastructure components. They promote modularity and code reusability.
    *   Outputs: Outputs provide a way to extract and expose information from the Terraform-managed infrastructure. They can be used to retrieve important details like resource IDs or endpoints.

## Coding Example

Let's dive in to setting up a static website using Terraform and hosting it on an S3 Bucket. Feel free to code along if you have two things:

  1. AWS account with at least one IAM user.
  2. Terraform installed and in your PATH.

Some prerequisites to go over first.

  1.  Downloading and Installing Terraform:
      
      *   For Windows users, you can download the binary for Windows from the Terraform website.
      *   Mac users can run the command `brew install terraform` in a terminal window.
      *   Linux (Debian Based) users can run the command `sudo apt-get install terraform` in a terminal window.
      *   Remember to add Terraform to your PATH environment variable.
    
  2.  Acquiring AWS Account Security Keys:
      
      *   Go to the AWS IAM console.
      *   Navigate to the Users tab and select the desired user.
      *   In the Security credentials tab, create an access key and download the corresponding .csv file.

Now that we have the prerequisites covered, let's move on to the Terraform code.

1.  Create a `local.auto.tfvars` file:
    
    *   In the root of the repository, create a file named `local.auto.tfvars`.
    *   Copy the following code into the file:
        
        ```makefile
        # Local Code Setup
        aws_access_key  = "YOUR_ACCESS_KEY_ID"
        aws_secret_key  = "YOUR_SECRET_ACCESS_KEY"
        aws_region      = "us-east-1"
        aws_bucket_name = "kramer-bucket"
        ```
        
    *   Replace the `YOUR_ACCESS_KEY_ID` and `YOUR_SECRET_ACCESS_KEY` with your AWS access key and secret access key obtained earlier.

2.  Declare variables in `variables.tf`:
    
    *   In the `variables.tf` file, we have declared the following variables:
        *   `aws_access_key`: AWS access key.
        *   `aws_secret_key`: AWS secret key.
        *   `aws_bucket_name`: The name of the S3 bucket for hosting the website.
        *   `aws_region`: The AWS region to deploy the resources.

3.  Define the AWS provider in `providers.tf`:
    
    *   In the `providers.tf` file, we specify the required AWS provider and its version.

4.  Configure outputs in `outputs.tf`:
    
    *   The `outputs.tf` file defines two outputs:
        *   `bucket_name`: The name of the S3 bucket created.
        *   `bucket_url`: The URL endpoint of the S3 bucket.

5.  Set up the S3 Bucket in `s3bucket.tf`:
    
    *   The `bucket.tf` file contains the resource block for creating the S3 bucket.
    *   The bucket is configured for static website hosting with an index document and an error document.

6.  Additional resources in `s3bucket.tf`:
    
    *   The `bucket.tf` file also includes resource blocks for configuring CORS (Cross-Origin Resource Sharing) and bucket access control.

7.  Build the website:
    
    *   Create the `index.html` file in the root of the repo.
    *   Make changes to the `index.html` file.
    *   Create the `styles.css` file in the root of the repo.
    *   Make changes to the `styles.css` file.

8.  Deploy the website:
    
    *   After setting up the necessary code, you can run `terraform init` to initialize the Terraform configuration.
    *   Then, run `terraform apply` to create the website resources.
    *   Once the process is complete, you can find the S3 bucket name and URL endpoint in the Terraform output.

That's it! You have successfully created a simple website using Terraform and an AWS S3 bucket with an `subindex.html` and accompanying `styles.css` sheet . You can access the website by clicking on the URL endpoint provided in the output.

## Re-Usability
Now, here is where this gets more powerful. In order to manual configure all of this, it would likely take around the same amount of time to do this over. You are limited to one use with it. When we can source control the code, we can leverage it with scale and source control our *.tf files in our repos alongside of our application code.

## Conclusion
I hope this lecture has provided you with a clear understanding of the steps involved in creating a simple website using Terraform and AWS S3 Bucket. Thank you for attending, and if you have any questions, feel free to ask!
