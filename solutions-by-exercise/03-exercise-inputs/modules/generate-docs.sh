#!/bin/bash
terraform fmt --recursive
terraform-docs markdown base --output-file README.md --output-mode replace
terraform-docs markdown mysql-db --output-file README.md --output-mode replace
terraform-docs markdown wordpress-vm --output-file README.md --output-mode replace