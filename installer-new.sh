echo "Start installing Oracle Worker"
apt-get update && apt-get install -y wget
wget https://github.com/ljm625/oracle_worker/raw/main/worker
wget https://github.com/ljm625/oracle_worker/raw/main/worker_new.service
mv ./worker /usr/bin/
mv ./worker_new.service /etc/systemd/system/worker.service
chmod +x /usr/bin/worker
systemctl daemon-reload
systemctl enable worker
systemctl start worker

