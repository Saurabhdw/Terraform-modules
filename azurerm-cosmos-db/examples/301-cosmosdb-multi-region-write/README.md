# 301 Cosmos DB SQL API Multi-Region Write
This template deploys a multi-region write cosmos db account (east and west us regions) with 2 sql databases (autoscale and no autoscale) and 2 cointainers (per each db) with default conflict resolution policy. This sample assumes that a resource group has been previously created and is referenced as an input parameter. A sample input parameters file has been included as part of this example.

## Variables 
| Name | Description |
|-|-|
| resource_group_name | Name of existing resource group |
| location | Location where cosmos db will be deployed to | 
| cosmos_account_name | Name of cosmos db account | 
| cosmos_api | API for Cosmos db, should be "sql" in this example | 
| geo_locations | Locations for cosmos db geo replication | 
| multi_region_write | Enable multi-region write |
| sql_dbs | Cosmos SQL DBs to create | 
| sql_db_containers | Cosmos SQL DB containers to create per each db | 

Please see terraform.tfvars.sample for example inputs. Above is the minimal input requirements for the cosmos db module. 

## Usage
```bash
terraform plan -out example.tfplan
terraform apply example.tfplan
```