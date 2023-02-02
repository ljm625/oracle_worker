echo "Start installing Oracle Worker"
apt-get update && apt-get install -y wget
wget https://github.com/ljm625/oracle_worker/raw/main/worker_arm
wget https://github.com/ljm625/oracle_worker/raw/main/worker_arm_new.service
mv ./worker_arm /usr/bin/worker
mv ./worker_arm_new.service /etc/systemd/system/worker.service
chmod +x /usr/bin/worker
chmod +x /usr/bin/cpulimit
systemctl daemon-reload
systemctl enable worker
systemctl start worker

