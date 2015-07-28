
start_seconds="$(date +%s)"

if [ ! -d "/etc/salt" ]; then
    echo "Bootstrap salt"
    wget -O- --no-check-certificate https://bootstrap.saltstack.com | sudo sh
fi

sudo cp /vagrant/salt/minion.conf /etc/salt/minion
sudo cp /vagrant/salt/master.conf /etc/salt/master

echo "Restart salt-minion"
sudo salt-minion -d
sudo service salt-minion restart

echo "Restart salt-master"
sudo salt-master -d
sudo service salt-master restart

echo "Executing salt highstate (provisionning)"
sudo salt-call state.highstate

end_seconds="$(date +%s)"
echo "-----------------------------"
echo "Provisioning complete in "$(expr $end_seconds - $start_seconds)" seconds"

