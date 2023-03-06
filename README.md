# Terraform, Ansible, and Docker Example

This example project showcases how to automate a Docker installation using Terraform and Ansible. The project first creates an Ubuntu server using Terraform and then installs Docker and Docker Compose using Ansible. Additionally, an Nginx configuration is set up.

## Usage

1. Clone this project.
2. Edit the variables in the `main.tf` file, which is the Terraform Main Configuration File, to fit your project's needs.
3. Use the `terraform apply` command to create the servers.
4. Use the `ansible-playbook` command to run the Ansible playbook and install Docker and Docker Compose.
5. Use the `terraform destroy` command to delete the servers when finished.

## Files

The following files are included in this project:

- `main.tf`: The Terraform Main Configuration File, which sets up the infrastructure.
- `outputs.tf`: The Terraform Outputs File, which displays the IP address of the server created.
- `provider.tf`: The Terraform Provider Configuration File, which configures the AWS provider.
- `variables.tf`: The Terraform Variables File, which sets the variables for the infrastructure.
- `userdata.sh`: The Terraform User Data File, which installs Ansible and runs the Ansible playbook.
- `inventory`: The Ansible Inventory File, which sets up the connection to the Ubuntu server.
- `playbook.yml`: The Ansible Playbook File, which installs Docker and Docker Compose and sets up Nginx.
- `roles/common/tasks/main.yml`: The Ansible Role Task File, which updates the apt cache and installs common packages.
- `roles/docker/tasks/main.yml`: The Ansible Role Task File, which adds the Docker GPG key and repository, installs Docker and Docker Compose.
- `files/nginx.conf`: The Ansible File Transfer File, which transfers the Nginx configuration to the server.
- `files/docker-compose.yml`: The Ansible File Transfer File, which transfers the Docker Compose configuration to the server.
- `templates/nginx.conf.j2`: The Ansible Template File, which contains the template for the Nginx configuration.

## Conclusion

We hope this example project has been useful for anyone looking to automate server configurations using Terraform and Ansible.
