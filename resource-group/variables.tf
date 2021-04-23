variable "environment" {
    type = string
    description = "The environment the resource group contains resources for."
    validation {
        condition = can(regex("^dev|prod$", var.environment))
        error_message = "The specified environment is not valid."
    }
}

variable "application" {
    type = string
    description = "The name of the application."
    validation {
        condition = can(regex("^[a-zA-Z]([a-zA-Z0-9\\-]){0,18}[a-zA-Z0-9]$", var.application))
        error_message = "The specified application name must be no longer than 20 characters, and consist of alphanumeric characters and hyphens ('-')."
    }
}

variable "region" {
    type = string
    description = "The abbreviation of the Azure region."
    validation {
        condition = can(regex("^euw$", var.region))
        error_message = "The specified application name must be no longer than 20 characters, and consist of alphanumeric characters and hyphens ('-')."
    }
}
