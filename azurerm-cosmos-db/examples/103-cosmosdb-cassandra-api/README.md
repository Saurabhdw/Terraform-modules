# 103 Cosmos DB SQL API 
This template deploys a cosmos db account with 2 Cassandra Keyspace (autoscale and no autoscale) and 2 Cassandra tables (per each keyspace). This sample assumes that a resource group has been previously created and is referenced as an input parameter. A sample input parameters file has been included as part of this example.

## Variables 
| Name | Description |
|-|-|
| resource_group_name | Name of existing resource group |
| location | Location where cosmos db will be deployed to | 
| cosmos_account_name | Name of cosmos db account | 
| cosmos_api | API for Cosmos db, should be "cassandra" in this example | 
| cassandra_keyspaces | Cosmos DB Keyspaces to create | 
| cassandra_tables | Cosmos DB Tables to create | 

Please see terraform.tfvars.sample for example inputs. Above is the minimal input requirements for the cosmos db module. 

## Usage
```bash
terraform plan -out example.tfplan
terraform apply example.tfplan
```