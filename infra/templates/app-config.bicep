@description('Specifies the name of the App Configuration store.')
param configStoreName string
param location string

resource configStore 'Microsoft.AppConfiguration/configurationStores@2021-10-01-preview' = {
  name: configStoreName
  location: location
  sku: {
    name: 'free'
  }
}

output configStoreName string = configStore.name
