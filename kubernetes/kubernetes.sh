#!/bin/bash
#cd cne-sfia2-briefs/
aws configure
echo AKIAZWEPZMSUILR35PVS
echo qUtfVHQbPrOZMFcZ+oknRNIWS5Wtpb+2jwtT30wu
echo eu-west-1
echo json
aws eks --region eu-west-1 update-kubeconfig --name 22-11-cluster
kubectl create ns project
kubectl apply -f secret.yaml
kubectl apply -f backend-app.yaml && kubectl apply -f backend-service.yaml
kubectl apply -f frontend-app.yaml && kubectl apply -f frontend-service.yaml
kubectl get pods -n project
kubectl get svc -n project
