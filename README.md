# Terraform Rancher
Terraform to deploy Rancher server on vSphere

## Requirements
Network connectivity from where terraform is executed to the vm_network

If you're running locally:
* [Terraform](https://www.terraform.io/downloads.html) >= 0.12
* [Kubectl](https://downloadkubernetes.com/)
* [Terraform RKE plugin](https://github.com/rancher/terraform-provider-rke)
* netcat

## Usage

#### Local
```bash
# create cluster
terraform apply -var-file=rancher.tfvars terraform/vsphere-rancher
# remove cluster
terraform destroy -var-file=rancher.tfvars terraform/vsphere-rancher
```

#### Docker
```bash
make image

# create cluster using default arguments
make terraform-apply
# create cluster using custom arguments
sh hack/runner.sh apply <path_to_tfvars_file> <path_to_deliverables_directory> 

# remove cluster using default arguments
docker run -it --rm -v ${PWD}/rancher.tfvars:/terraform/vsphere-rancher/terraform.tfvars -v ${PWD}/deliverables:/terraform/vsphere-rancher/deliverables terraform-rancher destroy -state=deliverables/terraform.tfstate
# remove cluster using custom arguments
sh hack/runner.sh destroy <path_to_tfvars_file> <path_to_deliverables_directory> 

```

or

```bash
make shell
# create cluster
terraform apply -var-file=terraform.tfvars -state=deliverables/terraform.tfstate
# remove cluster
terraform destroy -var-file=terraform.tfvars -state=deliverables/terraform.tfstate
```

## Notes

* `terraform apply` will create a `deliverables/` directory to save things like the kubeconfig, ssh keys, etc
* Releases will be published as container images in Github