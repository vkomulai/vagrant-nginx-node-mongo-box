#!/bin/sh
NODE_VER=0.12
MONGO_VER_MAJOR=3.0
MONGO_VER_DETAIL=3.0.6
LOCALE=en_US.UTF-8

sudo bash -c "echo 'LC_ALL=$LOCALE' >> /etc/environment"
sudo bash -c "echo 'LANGUAGE=$LOCALE' >> /etc/environment"
export LC_ALL=$LOCALE
export LANGUAGE=$LOCALE

# -- mongo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/$MONGO_VER_MAJOR multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-$MONGO_VER_MAJOR.list
sudo apt-get update
sudo apt-get install -y mongodb-org=$MONGO_VER_DETAIL mongodb-org-server=$MONGO_VER_DETAIL mongodb-org-shell=$MONGO_VER_DETAIL mongodb-org-mongos=$MONGO_VER_DETAIL mongodb-org-tools=$MONGO_VER_DETAIL
# Disable 127.0.0.01 to make mongo avalaible via vagrant port forwarding
sudo sed -i s/bind_ip/#bind_ip/ /etc/mongod.conf
sudo service mongod restart

# -- ngnix
sudo apt-get -y install nginx
sudo cp -f /vagrant/provisioning/ngnix-as-load-balancer.conf /etc/nginx/nginx.conf
sudo cp -f /vagrant/provisioning/selfsigned.* /etc/nginx/
sudo chmod 400 /etc/nginx/selfsigned.*

# -- node
sudo apt-get -y install vim curl
curl --silent --location https://deb.nodesource.com/setup_$NODE_VER | sudo bash -
sudo apt-get -y install nodejs

# node-dev, supervisor, pm2 fail in transimitting file changes to quest from host
sudo npm install forever -g
