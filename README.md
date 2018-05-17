# OMS Agent JSON
Docker Image to monitor a JSON endpoint using the Operations Management Suite (OMS).

## Requirements
In order to use this Docker Image, you first need to have Log Analytics deployed to your Azure Subscription. To deploy an instance, click [here](https://portal.azure.com/?feature.customportal=false#create/Microsoft.LogAnalyticsOMS).

## Usage

You need to inform some environment variables when creating the container:

 - WSID: Log Analytics Workspace Id.
 - SECRET: Log Analytics Workspace secret.
 - NAME: Application name.
 - URL: location a HTTP Get will be executed and a JSON structure is expected.

Runnig with Docker

```
docker run --detach -e WSID=<Your Workspace ID> -e SECRET=<Your Workspace Secret> -e NAME=<Your Application Name> -e URL=<URL to Monitor> rafaelgodinho/oms-agent-json
```

Running with Azure Container Instance
```
az container create --image rafaelgodinho/oms-agent-json --name <ACI Name> --resource-group <Resource Group Name> --environment-variables WSID=<Your Workspace ID> SECRET=<Your Workspace Secret> NAME=<Your Application Name> URL=<URL to Monitor>
```