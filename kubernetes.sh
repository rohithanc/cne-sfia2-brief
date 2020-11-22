#cd cne-sfia2-briefs/
echo 0
kubectl create ns project
echo 1
kubectl apply -f secret.yaml
echo 2
kubectl apply -f backend-app.yaml && kubectl apply -f backend-service.yaml
echo 3
kubectl apply -f frontend-app.yaml && kubectl apply -f frontend-service.yaml
echo 4
kubectl get pods -n project
echo 5
kubectl get svc -n project
