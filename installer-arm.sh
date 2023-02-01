echo "Start installing Oracle Worker"
apt-get update && apt-get install -y wget git build-essential
git clone https://github.com/opsengine/cpulimit
cd cpulimit
make
mv src/cpulimit /usr/bin
cd ..
rm -rf cpulimit
wget https://github.com/ljm625/oracle_worker/raw/main/worker_arm
wget https://github.com/ljm625/oracle_worker/raw/main/worker_arm.service
mv ./worker_arm /usr/bin/worker
mv ./worker_arm.service /etc/systemd/system/worker.service
chmod +x /usr/bin/worker
chmod +x /usr/bin/cpulimit
systemctl daemon-reload
systemctl enable worker
systemctl start worker

