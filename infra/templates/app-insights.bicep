@description('Name of Application Insights resource.')
param appInsightsName string

param location string

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-03-01-preview' = {
  name: '${appInsightsName}workspace'
  location: location
  properties: {
    retentionInDays: 5
    sku: {
      name: 'pergb2018'
    }
  }
}

resource component 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Bluefield'
    Request_Source: 'CustomDeployment'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}
