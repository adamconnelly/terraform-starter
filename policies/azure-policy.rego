package spacelift

# This policy enforces certain standards for Azure resources

deny[sprintf("Resource groups must have the environment tag specified (%s)", [resource.address])] {
    resource := resource_group[_]
    not resource.change.after.tags["environment"]
}

warn[sprintf("Plan will result in a stateful resource being deleted (%s)", [resource.address])] {
    resource := stateful_resource[_]
    resource.change.actions[_] == "delete"
}

resource_group[resource] {
    resource := created_resources[_]
    resource.type == "azurerm_resource_group"
}

stateful_resource[resource] {
    stateful_resource_types := {
        "azurerm_storage_account",
        "azurerm_mssql_database"
    }
    resource := input.terraform.resource_changes[_]
    contains(resource.type, stateful_resource_types[_])
}

# Learn more about sampling policy evaluations here:
#
# https://docs.spacelift.io/concepts/policy#sampling-policy-inputs
sample { true }
