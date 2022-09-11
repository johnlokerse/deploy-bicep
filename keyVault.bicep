param parKeyVaultName string = 'kv-we-workload-002'
param parLocation string = 'westeurope'
param parSpnObjectId string

var varTenantId = tenant().tenantId

resource resKeyVault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: parKeyVaultName
  location: parLocation
  properties: {
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    tenantId: varTenantId
    accessPolicies: [
      {
        tenantId: varTenantId
        objectId: parSpnObjectId
        permissions: {
          keys: [
            'get'
          ]
          secrets: [
            'list'
            'get'
          ]
        }
      }
    ]
    sku: {
      name: 'standard'
      family: 'A'
    }
  }
}
