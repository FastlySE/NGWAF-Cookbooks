# NGWAF-Usecases

This is a collection of use-cases for the Fastly Next Gen WAF (powered by Signal Sciences) written in Terraform.
They can be used as individual snippets, or combined together to create a base for a WAF policy used in a POC or Demo environment.

The Fastly Next Gen WAF (Signal Sciences) is amazing right out of the box. We can use the framework that it provides to provide more suggestions about how to get the most out of the product. 

This repository provides the following functionaliy.

- Block attack traffic from known suspicious sources
- Block Requests from Known Bad User Agents (CLI or Scraper tools)
- Block Requests from unwanted regions
- Provide restrictions on the use of an API

These use cases are quite basic, but provide a good starting point when building a demo lab from Terraform. 
More complex use-cases will be added in the future.

Thanks goes to Aneel Dadani and Brooks Cunningham @Fastly for their work creating the examples I used as a baseline for this repo.

* Note - the Terraform examples are for WAF policy configuration only. You will need to have the WAF instance in place for this to work.
If you want to go further an create the actual Cloud WAF instance (or other deployment types) - please see the official Terraform docs: https://registry.terraform.io/providers/signalsciences/sigsci/latest/docs/resources/corp_cloudwaf_instance?_fsi=xNYIG3Rx


# How to use this repo
* (optional) create a site.auto.tfvars with your site variable so you do not have to be prompted each time you run `terraform plan` or `terraform apply`
* Set up the following variables however you like. They will make the demo run smoother and remove the need to supply this information each time.  
    * SIGSCI_CORP
    * SIGSCI_EMAIL
    * SIGSCI_TOKEN
* Run the command `terraform apply`

# Demo Environment Setup (optional)
- GitHUB Account (this is where the main policy is stored as a source of truth)
- Terraform Cloud Account - this is optional, but provides a more visual demo and provides easy hooks into the Github source configuration
- NGWAF/SigSci demo account

Once all these components are in place, do the following:
- Configure a new Repository in GitHUB for the Terraform policy configuration.

- Configure a new Terraform Cloud Workspace. Select the "Version Control Workflow" option:
<img width="1428" alt="tfc" src="https://user-images.githubusercontent.com/113071464/210287918-316b253b-b1af-4f65-b4f4-706ee5a9aad6.png">

- Once this has been completed, any changes to the "main" branch within GitHub will trigger Terraform Cloud to run the "plan" and "apply" actions and if successful will update the Fastly Next-Gen WAF policy.

