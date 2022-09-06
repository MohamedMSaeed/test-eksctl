#! /bin/bash

CLUSTER_NAME=
CONFIG_FILE=clusters/${CLUSTER_NAME}/eksctl-cluster.yaml

# Check if the cluster exists from AWS
export CLUSTER_EXISTS=$(eksctl get clusters | grep -i $CLUSTER_NAME)
if [ -z $CLUSTER_EXISTS ]; then
  # Create EKS cluster
  eksctl create cluster -f ${CONFIG_FILE}
fi
