if ( ! docker stats --no-stream > /dev/null ); then
  echo 'Docker daemon is not running. Exiting'
  exit 1;
fi

tfvars=${1:-"${PWD}/rancher.tfvars"}
deliverables=${2:-"${PWD}/deliverables"}

if [ ! -f "$tfvars" ]; then
  echo 'tfvars file not found. Exiting'
  exit 1;
fi

if [ ! -d "$deliverables" ]; then
  echo 'deliverables directory not found. Exiting'
  exit 1;
fi

make image
docker run -it --rm -v "$tfvars":/terraform/vsphere-rancher/rancher.tfvars -v "$deliverables":/terraform/vsphere-rancher/deliverables terraform-rancher apply -state=deliverables/terraform.tfstate
