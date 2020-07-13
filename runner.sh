if ( ! docker stats --no-stream > /dev/null ); then
  echo 'Docker daemon is not running. Exiting'
  exit 1;
fi

tfvars=${1:-'./terraform/vsphere-rancher/rancher.tfvars'}
deliverables=${2:-'./terraform/vsphere-rancher/deliverables'}

if [ ! -f "$tfvars" ]; then
  echo 'tfvars file not found. Exiting'
  exit 1;
fi

if [ ! -d "$deliverables" ]; then
  echo 'deliverables directory not found. Exiting'
  exit 1;
fi

make image
docker run -it --rm -v "${PWD}"/rancher.tfvars:"$tfvars" -v "${PWD}"/deliverables:"$deliverables" terraform-rancher apply -state=deliverables/terraform.tfstate
