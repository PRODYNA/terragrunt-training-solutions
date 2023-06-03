#!/bin/bash
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common

# Add apt repos
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository --yes \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install Docker
sudo apt-get -y install docker-ce mariadb-client-core-10.6

echo -e "\n\nCreating database 'wordpress' on MySQL server..."
echo "create database ${db_name}" | mysql --host=${db_url} --user=${db_user} --password=${db_pass} && echo "Database created!"
sleep 10

echo "Starting Wordpress server.."
sudo docker stop wordpress &>/dev/null | true
sudo docker rm wordpress &>/dev/null | true
sudo docker run -d --name wordpress -e WORDPRESS_DB_HOST=${db_url} -e WORDPRESS_DB_USER=${db_user} -e WORDPRESS_DB_PASSWORD=${db_pass} -e WORDPRESS_DB_NAME=${db_name} -e WORDPRESS_TABLE_PREFIX=wp_ --network host wordpress