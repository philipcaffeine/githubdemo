param location string = 'West Europe'
param resourceGroupName string = 'example-resources'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: 'examplestorageacct'
  location: resourceGroup.location
  resourceGroupName: resourceGroup.name
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2021-06-01-preview' = {
  name: 'example-sbnamespace'
  location: resourceGroup.location
  resourceGroupName: resourceGroup.name
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}

resource serviceBusQueue 'Microsoft.ServiceBus/namespaces/queues@2021-06-01-preview' = {
  name: 'example-queue'
  namespaceName: serviceBusNamespace.name
  resourceGroupName: resourceGroup.name
}

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: 'example-appserviceplan'
  location: resourceGroup.location
  resourceGroupName: resourceGroup.name
  sku: {
    name: 'Y1'
    tier: 'Dynamic'
  }
}

resource functionApp 'Microsoft.Web/sites@2021-02-01' = {
  name: 'example-functionapp'
  location: resourceGroup.location
  resourceGroupName: resourceGroup.name
  kind: 'functionapp'
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'AzureWebJobsStorage'
          value: storageAccount.properties.primaryEndpoints.blob
        },
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~3'
        },
        {
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        }
      ]
    }
  }
}

resource cosmosDbAccount 'Microsoft.DocumentDB/databaseAccounts@2021-04-15' = {
  name: 'example-cosmosdb'
  location: resourceGroup.location
  resourceGroupName: resourceGroup.name
  kind: 'GlobalDocumentDB'
  properties: {
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
    }
    locations: [
      {
        locationName: resourceGroup.location
        failoverPriority: 0
      }
    ]
  }
}

resource searchService 'Microsoft.Search/searchServices@2020-08-01' = {
  name: 'example-search'
  location: resourceGroup.location
  resourceGroupName: resourceGroup.name
  sku: {
    name: 'standard'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
  }
}

resource openAiService 'Microsoft.CognitiveServices/accounts@2021-04-30' = {
  name: 'example-openai'
  location: resourceGroup.location
  resourceGroupName: resourceGroup.name
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
}
