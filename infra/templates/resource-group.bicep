targetScope = 'subscription'

param resourceGroupName string
param location string

resource newRG 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: location
}

output resourceGroupName string = resourceGroupName
