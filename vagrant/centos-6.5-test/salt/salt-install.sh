cd
#wget https://anorien.csc.warwick.ac.uk/mirrors/epel/6/i386/epel-release-6-8.noarch.rpm
#sudo rpm -Uvh epel-release-6-8.noarch.rpm

cd /etc/yum.repod.d
sudo wget --no-check-certificate https://copr.fedoraproject.org/coprs/saltstack/zeromq4/repo/epel-6/saltstack-zeromq4-epel-6.repo

yum install -y git

sudo yum install -y salt-master

sudo cp /vagrant/salt/master.conf /etc/salt/master
sudo mkdir -p /etc/salt/pki/master/minions
sudo cp /vagrant/salt/key/127.0.0.1.pub /etc/salt/pki/master/minions/127.0.0.1
sudo chkconfig salt-master on
sudo service salt-master start

sudo yum install -y salt-minion
sudo mkdir -p /etc/salt/pki/minion
sudo cp /vagrant/salt/minion.conf /etc/salt/minion
sudo cp /vagrant/salt/key/127.0.0.1.pem /etc/salt/pki/minion/minion.pem
sudo cp /vagrant/salt/key/127.0.0.1.pub /etc/salt/pki/minion/minion.pub
sudo chkconfig salt-minion on
sudo service salt-minion start

sudo salt '127.0.0.1' state.highstate

