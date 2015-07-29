# SaltStack

Going with (SaltStack)[http://saltstack.com/] as the configuration management
option, at least for now.

## CentOS 6.5

### Common set-up

See (docs)[http://docs.saltstack.com/en/latest/topics/installation/rhel.html].
and (zeromq4)[http://copr.fedoraproject.org/coprs/saltstack/zeromq4/].

```
cd
wget https://anorien.csc.warwick.ac.uk/mirrors/epel/6/i386/epel-release-6-8.noarch.rpm
sudo rpm -Uvh epel-release-6-8.noarch.rpm

cd /etc/yum.repod.d
sudo wget --no-check-certificate https://copr.fedoraproject.org/coprs/saltstack/zeromq4/repo/epel-6/saltstack-zeromq4-epel-6.repo

rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

yum install git
```
and one or both of master or minion

### Master set-up

```
sudo yum install salt-master

cd /srv
git clone https://github.com/cgreenhalgh/devops-sample.git
mkdir /srv/formulas
cd /srv/formulas
git clone https://github.com/cgreenhalgh/apache-formula.git
git clone https://github.com/cgreenhalgh/nagios-formula.git
```
Now set up the salt configuration, `/etc/salt/master`:
```
file_roots:
  base:
    - /srv/devops-sample/saltstack/salt
    - /srv/formulas/apache-formula
    - /srv/formulas/nagios-formula
```
Start salt with:
```
sudo chkconfig salt-master on
sudo service salt-master start

```

### Minion set-up

```
sudo yum install salt-minion
```
Edit '/etc/salt/minion' - replace `127.0.0.1` as appropriate with master
 address and minium id:
```
master: 127.0.0.1
id: 127.0.0.1
```
```
sudo chkconfig salt-minion on
sudo service salt-minion start
```
