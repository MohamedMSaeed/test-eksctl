#! /bin/bash

# make-cluster.sh --cluster-name hamada --cluster-version 1.21

if [ -z $1 ]
then
  echo "You have to enter the cluster name."
  exit 1
fi

CLUSTER_NAME="$1"
CLUSTER_VERSION="1.21"

# check that the cluster was not created before with the same name from the dir side:
if [ -d "clusters/${CLUSTER_NAME}" ]
then 
  echo "A cluster dir with the same name is found. Please choose another name!"
fi

# check it from aws side
# clusters=`eksctl get cluster -o json`


# Clsuter is not created before!!


# create dir for the cluster
mkdir -p clusters/${CLUSTER_NAME}/management

# copy WGE files
echo "Coping WGE templates"

# copy eksctl config to cluster dir
cp cluster-tmp.yaml clusters/${CLUSTER_NAME}/eksctl-cluster.yaml
sed -i 's/${CLUSTER_NAME}/'"${CLUSTER_NAME}"'/g' clusters/${CLUSTER_NAME}/eksctl-cluster.yaml
sed -i 's/${CLUSTER_VERSION}/'"${CLUSTER_VERSION}"'/g' clusters/${CLUSTER_NAME}/eksctl-cluster.yaml

echo "file \"clusters/${CLUSTER_NAME}/eksctl-cluster.yaml\" has been created"
echo "Please, commit the file and create a PR to deploy it to provision the cluster"
