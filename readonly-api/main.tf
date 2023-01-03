terraform {
  required_providers {
    sigsci = {
      source = "signalsciences/sigsci"
	  version = "1.2.2"
    }
  }
}

variable "SIGSCI_CORP" {
    type        = string
    description = "This is the corp where configuration changes will be made as an env variable."
}
variable "SIGSCI_EMAIL" {
    type        = string
    description = "This is the email address associated with the token for the Sig Sci API as an env variable."
}
variable "SIGSCI_TOKEN" {
    type        = string
    description = "This is a secret token for the Sig Sci API as an env variable."
}
variable "SIGSCI_SITE" {
    type        = string
    description = "This is the site for the Sig Sci API as an env variable."


# Supply API authentication
provider "sigsci" {
  corp = "${var.SIGSCI_CORP}"
  email = "${var.SIGSCI_EMAIL}"
  auth_token = "${var.SIGSCI_TOKEN}"
}

# Add a signal when there is an API misused
resource "sigsci_corp_rule" "api-misuse" {
    corp_scope       = "global"
    enabled          = true
    group_operator   = "all"
    reason           = "Add rule to make API endpoint readonly"
    type             = "request"
    expiration = ""
    actions {
    type = "block"
    }
    actions {
    type = "addSignal"
    signal = "corp.readonly-api" 
    }
    conditions {
        group_operator = "all"
        type           = "group"

        conditions {
        field    = "method"
        operator = "equals"
        type     = "single"
        value    = "POST"
    	}
        conditions {
        field    = "path"
        operator = "contains"
        type     = "single"
        value    = "/v2/api/inventory"
        }
    }

}
### End API Misuse Section
