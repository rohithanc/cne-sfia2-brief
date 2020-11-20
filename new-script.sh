ssh -tt -i /home/jenkins/.ssh/id_rsa ubuntu@52.215.78.226 << EOF
cd cne-sfia2-brief/database
sudo docker exec backend bash -c "pytest tests/ --cov application" >> 
sudo docker exec frontend bash -c "pytest tests/ --cov application"
sudo docker-compose down
EOF
