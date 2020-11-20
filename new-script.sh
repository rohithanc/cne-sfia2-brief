ssh -tt -i /home/jenkins/.ssh/id_rsa ubuntu@52.215.78.226 << EOF
sudo rm -r cne-sfia2-brief
git clone http://github.com/rohithanc/cne-sfia2-brief
cd cne-sfia2-brief
cd database
mysql -h cne-testdb.cjhtseh9p1qi.eu-west-1.rds.amazonaws.com -P 3306 -u rohithanc -pPassword123 < Create.sql
mysql -h cne-productiondb.cjhtseh9p1qi.eu-west-1.rds.amazonaws.com -P 3306 -u rohithanc -pPassword123 < Create.sql
cd ..
sudo docker-compose up -d
sudo docker exec backend bash -c "pytest tests/ --cov application" 
sudo docker exec frontend bash -c "pytest tests/ --cov application"
sudo docker-compose down
EOF
