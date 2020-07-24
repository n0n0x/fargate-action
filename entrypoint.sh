#!/bin/bash -l

REGION_LIST=$1
SERVICE=$2
CLUSTER=$3
IMAGE=$4

OIFS=$IFS
IFS=';'
REGIONS_SPACE=$REGIONS

while IFS=',' read -ra REGIONS; do
    for REGION in "${REGIONS[@]}"; do
		echo "* Updating service $SERVICE on cluster $CLUSTER for region $REGION ..."
        fargate service deploy $SERVICE --cluster $CLUSTER -i $IMAGE --region $REGION
    done
done <<< "$REGION_LIST"
