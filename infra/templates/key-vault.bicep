param kvName string
param location string
param tenantId string

resource key_vault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: kvName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: tenantId
    enableSoftDelete: false
    accessPolicies: [
      {
        //Public Owner ID
        objectId: '8e3af657-a8ff-443c-a75c-2fe8c4bcb635'
        permissions: {
          keys: [ 'all' ]
          certificates: [ 'all' ]
          secrets: [ 'all' ]
          storage: [ 'all' ]
        }
        tenantId: tenantId
      }
    ]
  }
}

output keyvaultId string = key_vault.id
