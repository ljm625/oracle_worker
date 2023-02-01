echo "Start installing Oracle Worker"
apt install update && apt install -y wget
wget https://github.com/ljm625/oracle_worker/raw/main/worker
wget https://github.com/ljm625/oracle_worker/raw/main/cpulimit
wget https://github.com/ljm625/oracle_worker/raw/main/worker.service
mv ./worker /usr/bin/
mv ./cpulimit /usr/bin/
mv ./worker.service /etc/systemd/system/
chmod +x /usr/bin/worker
chmod +x /usr/bin/cpulimit
systemctl daemon-reload
systemctl enable worker
systemctl start worker

