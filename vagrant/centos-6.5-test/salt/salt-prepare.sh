yum install -y git
[ -d /srv ] ||  mkdir /srv
cd /srv
[ -d devops-sample ] || git clone https://github.com/cgreenhalgh/devops-sample.git
[ -d formulas ] || mkdir /srv/formulas
cd /srv/formulas
[ -d apache-formula ] || git clone https://github.com/cgreenhalgh/apache-formula.git
