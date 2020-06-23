#!/bin/bash

sudo apt update

sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "+------------------+"
echo "|     CURL OK      |"
echo "+------------------+"

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

echo "======================================="
echo "Docker added to source pcg successfully"
echo "======================================="

sudo apt update

echo "+------------------+"
echo "|    UPDATE OK     |"
echo "+------------------+"

sudo apt-cache policy docker-ce

echo -n "Next? (y/n) "

read item
case "$item" in
    y|Y) echo "Go-go-go"
        sudo apt install docker-ce -y
	echo "+------------------+"
	echo "| DOCKER INST OK   |"
	echo "+------------------+"
    
        sudo apt install py-pip python-dev libffi-dev openssl-dev gcc libc-dev
        sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
    
		sudo systemctl status docker
		;;
    n|N) echo "Try again"
        exit 0
        ;;
    *) echo "Nothing to do."
        exit 0;;
esac
