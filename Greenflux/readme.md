# Technical assessment for Greenflux

Terraform deployments on Azure written to-spec as contained in the brief.
Took the liberty to use Terraform instead of Powershell or Bash for better manageability.

## How to use:
Cd to the clone directory and run:
```bash
terraform init
```
Review the execution plan with:
```bash
terraform plan
```
Run the plan:
```bash
terraform apply
```

## Security notes:

* Subnet security and peering security here is pretty good I think, networks are peered but accessability
is still tightly bound to the network security group

## CI/CD notes:
* Can easily be run in any CI/CD pipelines supporting Terraform (Azure DevOps, Jenkins, Ansible, and so on...)
* Be sure to pass in admin variables securely - do not leak sensitive info in pipeline logs

## TODO:
* Ensure connectivity to VM deployment from 195.169.110.175 with password auth (see brief)