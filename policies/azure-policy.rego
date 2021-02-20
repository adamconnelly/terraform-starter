package spacelift

# This policy enforces certain standards for Azure resources

deny[sprintf("Resource groups must have the environment tag specified (%s)", [resource.address])] {
    resource := resource_group[_]
    resource.change.after.tags["environment"]
}

resource_group[resource] {
    resource := created_resources[_]
    resource.type == "azurerm_resource_group"
}

# Learn more about sampling policy evaluations here:
#
# https://docs.spacelift.io/concepts/policy#sampling-policy-inputs
sample { true }
