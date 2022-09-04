#! /bin/bash

# Create EKS cluster using eksctl command.
eksctl create cluster -f clusters/${CLUSTER_NAME}/cluster.yaml
