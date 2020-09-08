# Technical assessment for Greenflux

Terraform deployments on Azure written to-spec as contained in the brief.
Took the liberty to use Terraform instead of Powershell or Bash for better manageability.

Tools:
* 

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

## TODO:
* Ensure connectivity to VM deployment from 195.169.110.175 with password auth (see brief)