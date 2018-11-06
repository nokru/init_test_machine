#
#  get this file by executing as root
#  wget -qO- https://raw.githubusercontent.com/nokru/init_test_machine/master/initscript.sh | bash
#

apt-get install -y git curl

cd /tmp

git clone https://github.com/nokru/init_test_machine.git init_scripts

cd init_scripts

#key encryption
# tar cz keys | \
#      openssl enc -aes-256-cbc -e > keys.tar.gz.enc
#is standard password

openssl enc -aes-256-cbc -d -in keys.tar.gz.enc | tar xz

cd keys
cp * /root/.ssh/

service ssh restart

