#!/bin/bash

# Verify all prerequisite installations
docker --version
docker compose version
kubectl version
gcloud version

# Build images for web & api application
docker compose build

# Push images to public repo
# docker login --username zhouji2018 --password <User-Password>
# (OR)
# cat ~/my_password.txt | docker login --username zhouji2018 --password-stdin
docker push zhouji2018/cisc5550todoapp
docker push zhouji2018/cisc5550todoapi


# Setup Google Cloud Project
# gcloud init 
# gcloud config set project cisc5550-demo
gcloud config set project todo-app-386303 
# gcloud components install gke-gcloud-auth-plugin

# Create GCP Cluster
gcloud container clusters create cisc5550-cluster --region asia-south1 --disk-size=30GB  --num-nodes=1
gcloud container clusters get-credentials cisc5550-cluster --region asia-south1

kubectl apply -f deployment

kubectl get service cc5550-frontend-service

# for cleanup
# kubectl delete -f deployment
# docker compose down --rmi all
# gcloud container clusters delete cisc5550-cluster  --region asia-south1
