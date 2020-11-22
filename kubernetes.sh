cd cne-sfia2-briefs 
kubectl create ns project
kubectl apply -f secret.yaml
kubectl apply -f backend-app.yaml && kubectl apply -f backend-service.yaml
kubectl apply -f frontend-app.yaml && kubectl apply -f frontend-service.yaml
kubectl get pods -n project
kubectl get svc -n project
