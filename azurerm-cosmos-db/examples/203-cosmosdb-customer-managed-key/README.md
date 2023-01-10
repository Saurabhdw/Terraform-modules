# 203 Cosmos DB SQL API 
This template deploys a cosmos db account with 2 sql databases (autoscale and no autoscale) and 2 containers (per each db) encrypted using customer managed key. This sample assumes that a resource group, Azure key vault, and encryption key have been previously created outside of the module and is referenced as an input parameter. A sample input parameters file has been included as part of this example. The example also demonstrates swapping out FirstPartyIdentity to SystemAssignedIdentity for default_identity_type using the AzApi provider.

## Variables 
| Name | Description |
|-|-|
| resource_group_name | Name of existing resource group |
| location | Location where cosmos db will be deployed to | 
| cosmos_account_name | Name of cosmos db account | 
| cosmos_api | API for Cosmos db, should be "sql" in this example | 
| sql_dbs | Cosmos SQL DBs to create | 
| sql_db_containers | Cosmos SQL DB containers to create per each db | 
| key_vault_name | Name of the existing key vault | 
| key_vault_rg_name | Name of the resource group where key vault exists | 
| key_vault_key_name | Name of the existing key which is going to be used for encryption | 

Please see terraform.tfvars.sample for example inputs. Above is the minimal input requirements for the cosmos db module. 

## Usage
```bash
terraform plan -out example.tfplan
terraform apply example.tfplan
```