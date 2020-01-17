#!/usr/bin/env bash

echo "Launching ACI Instance..."

resource_group="$1"

{
	az container create --resource-group $resource_group --template-file aci-template.json
	IP=$(sed -e 's/^"//' -e 's/"$//' <<< `az container show --name demo-aci --resource-group -yours goes here- | jq .ipAddress.ip`)

	STATE=`az container show --name demo-aci --resource-group -yours goes here- | jq .state`
	while [ "$STATE" != \""Running\"" ]; do
		STATE=`az container show --name demo-aci --resource-group -yours goes here- | jq .state`
	done
}  &> /dev/null
curl $IP