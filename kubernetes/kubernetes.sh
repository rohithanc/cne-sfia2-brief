#!/bin/bash
ssh -tt -i /home/jenkins/.ssh/id_rsa ubuntu@3.250.123.52 << EOF
cd cne-sfia2-brief/kubernetes/
kubectl create ns project
kubectl apply -f secret.yaml
kubectl apply -f backend-app.yaml && kubectl apply -f backend-service.yaml
kubectl apply -f frontend-app.yaml && kubectl apply -f frontend-service.yaml
kubectl get pods -n project
kubectl get svc -n project
logout
EOF
