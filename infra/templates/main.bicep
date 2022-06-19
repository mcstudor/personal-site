@minLength(3)
@maxLength(24)
@description('Globally unique name for Key Vault')
param kvName string

@minLength(5)
@maxLength(50)
@description('Globally unique name for Azure Container Registry')
param acrName string

param location string = resourceGroup().location
param tenantId string = subscription().tenantId

module keyVault 'key-vault.bicep' = {
  name: '${kvName}-deploy'
  params: {
    location: location
    tenantId: tenantId
    kvName: kvName
  }
}

module acr 'acr.bicep' = {
  name: '${acrName}-deploy'
  params: {
    acrName: acrName
    location: location
  }
}
