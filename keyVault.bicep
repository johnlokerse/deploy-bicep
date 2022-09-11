param parKeyVaultName string = 'kv-we-workload-001'
param parLocation string = 'westeurope'

var varTenantId = tenant().tenantId
var varObjectId = '<insert-guid>'

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
        objectId: varObjectId
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
