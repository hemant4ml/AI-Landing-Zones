using './main.bicep'

// Per-service deployment toggles.
param deployToggles = {
  acaEnvironmentNsg: true
  agentNsg: true
  apiManagement: false
  apiManagementNsg: false
  appConfig: true
  appInsights: true
  applicationGateway: true
  applicationGatewayNsg: true
  applicationGatewayPublicIp: true
  bastionHost: true
  bastionNsg: true
  buildVm: true
  containerApps: true
  containerEnv: true
  containerRegistry: true
  cosmosDb: true
  devopsBuildAgentsNsg: true
  firewall: false
  groundingWithBingSearch: false
  jumpVm: true
  jumpboxNsg: true
  keyVault: true
  logAnalytics: false
  peNsg: true
  searchService: true
  storageAccount: true
  virtualNetwork: true
  wafPolicy: true
}

// Existing resource IDs (empty means create new).
param resourceIds = {}

// Enable platform landing zone integration. When true, private DNS zones and private endpoints are managed by the platform landing zone.
param flagPlatformLandingZone = false

// Network Configuration
param vNetDefinition = {
  name: 'main-vnet'
  addressPrefixes: ['10.199.0.0/16']
  subnets: [
    {
      name: 'agent-subnet'
      addressPrefix: '10.199.0.0/24'
    }
    {
      name: 'pe-subnet'
      addressPrefix: '10.199.1.0/24'
    }
    {
      name: 'AzureBastionSubnet'
      addressPrefix: '10.199.2.0/26'
    }
    {
      name: 'AzureFirewallSubnet'
      addressPrefix: '10.199.2.64/26'
    }
    {
      name: 'appgw-subnet'
      addressPrefix: '10.199.2.128/27'
    }
    {
      name: 'apim-subnet'
      addressPrefix: '10.199.2.160/27'
    }
    {
      name: 'jumpbox-subnet'
      addressPrefix: '10.199.2.192/28'
    }
    {
      name: 'devops-agents-subnet'
      addressPrefix: '10.199.2.208/28'
    }
    {
      name: 'aca-env-subnet'
      addressPrefix: '10.199.4.0/23'
    }
  ]
}
