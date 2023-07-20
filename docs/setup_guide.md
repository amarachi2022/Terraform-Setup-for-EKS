
## Terraform Setup for Amazon Elastic Kubernetes Service (EKS) - Setup Guide

### Prerequisites

Before you begin, ensure you have the following prerequisites set up:

1. **AWS CLI and Credentials:**
   - Install the AWS Command Line Interface (AWS CLI) on your local machine.
   - Configure the AWS CLI with your access key, secret key, default region, and output format. You can set this up by running `aws configure` and following the prompts.

2. **Terraform:**
   - Install Terraform on your local machine. You can download it from the [Terraform website](https://www.terraform.io/downloads.html) and follow the installation instructions for your operating system.

3. **Kubectl (Optional):**
   - If you want to interact with the EKS cluster using `kubectl`, install `kubectl` on your local machine.

### Clone the Repository

To get started, clone this repository to your local machine using `git`:

```bash
git clone https://github.com/your-username/terraform-eks-setup.git
cd terraform-eks-setup
```

### Configure Variables

1. **AWS Credentials:**
   - Open the `variables.tf` file in the root directory of the repository.
   - Modify the `default` values of the `aws_access_key` and `aws_secret_key` variables to use your AWS credentials.

2. **EKS Cluster Configuration (Optional):**
   - Review and adjust other variables in the `variables.tf` file as needed, such as `cluster_name`, `region`, and `instance_type`.

### Initialize and Apply

1. **Initialize Terraform:**
   Run the following command to initialize Terraform and download the required plugins:

   ```bash
   terraform init
   ```

2. **Plan the Changes:**
   Before applying the changes, you can preview the infrastructure modifications with the following command:

   ```bash
   terraform plan
   ```

3. **Apply the Changes:**
   If the plan looks good, apply the Terraform configuration to create the EKS cluster:

   ```bash
   terraform apply
   ```

   Type `yes` when prompted to confirm the action.

### Access the EKS Cluster

1. **Configure kubectl (Optional):**
   If you want to use `kubectl` to interact with the EKS cluster, run the following command:

   ```bash
   aws eks --region <region> update-kubeconfig --name <cluster_name>
   ```

   Replace `<region>` with your AWS region and `<cluster_name>` with the name you provided in the `variables.tf` file.

2. **Verify the Cluster:**
   To ensure that the EKS cluster was created successfully, you can run the following command:

   ```bash
   kubectl get nodes
   ```

   This should display the list of worker nodes in your EKS cluster.

### Cleanup

To avoid unnecessary costs, make sure to clean up the resources when you're done:

```bash
terraform destroy
```

Type `yes` when prompted to confirm the destruction of the resources.

---

