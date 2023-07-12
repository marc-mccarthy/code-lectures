# Terraform & AWS: Creating a GitHub Repository with Terraform (Repo Surplus)

## Prerequisites

### Downloading and Installing Terraform

* Windows
    * Go to the Terraform website: https://www.terraform.io/downloads.html and download the binary for Windows.
    * Run the installer.
    * Add Terraform to your PATH environment variable.
      * ```
        no commands for windows
        ```
* MacOS
    * Open a terminal window.
    * Run the following command:
      * ```
        brew install terraform
        ```
* Linux (Debian Based)
    * Open a terminal window.
    * Run the following command:
      * ```
        sudo apt-get install terraform
        ```
**Here are other [Terraform CLI Installation Methods](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) installation methods if you prefer another install method.**

To add Terraform to your PATH environment variable, you can follow these steps:
  * Open a text editor and create a file called `.bashrc` in your home directory.
  * Add the following line to the file:
    * ```
      export PATH=$PATH:$HOME/bin
      ```

* Save the file and close the text editor.
* Open a new terminal window and run the following command:
  * ```
    source ~/.bashrc
    ```
**Depending on your method of install, this step may vary. See [Terraform CLI Installation Methods](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) for details on your method requirements for adding to the PATH.

### Acquiring AWS Account Security Keys

* Go to the AWS IAM console: https://console.aws.amazon.com/iam/.
* Click on the **Users** tab.
* Select the user that you want to get the security keys for.
* Click on the **Security credentials** tab.
* Click on the **Create access key** button.
* Click on the **Download .csv** button to download the security keys.

The security keys will be a .csv file that contains the access key ID and secret access key. You will need to enter these keys into the `local.auto.tfvars` file.

## Terraform Code

### Create a `local.auto.tfvars` file

1. Create a `local.auto.tfvars` in the root of the repo.
2. Add the following code making sure to replace the key values below with your keys:

```terraform
# Local Code Setup
github_token = "YOUR_GITHUB_TOKEN"
github_owner = "YOUR_GITHUB_OWNER"
```

Once you have entered the security keys into the `local.auto.tfvars` file, you can run the `terraform init` and `terraform apply` commands to create the website.
