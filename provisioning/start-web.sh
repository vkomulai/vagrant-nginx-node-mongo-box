#!/bin/sh

# start ngnix which acts as round-robin LB
sudo service nginx restart

cd /vagrant

INSTANCE_PORTS="3000 3001"
for port in $INSTANCE_PORTS
do
    PORT=$port forever start --plain --watch ./bin/www
done
