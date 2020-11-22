ssh -tt -i /home/jenkins/.ssh/id_rsa ubuntu@52.215.78.226 << EOF
sudo docker login -u rohithan9615 -p
cd frontend
sudo docker build -t rohithan9615/frontend
cd ..
cd backend
sudo docker build -t rohithan9615/backend
sudo docker push rohithan9615/frontend
sudo docker push rohithan9615/backend
logout
EOF
