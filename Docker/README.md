# Docker and Docker Compose


## Installing Docker

Add Docker's official GPG key:

```sh
sudo -E apt-get update
sudo -E apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

Add the repository to apt sources:

```sh
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$UBUNTU_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo -E apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
docker --version
```


## Installing Docker Compose

```sh
VERSION="v2.22.0"
sudo curl -L "https://github.com/docker/compose/releases/download/$VERSION/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version
```


## Basic commands

```sh
sudo docker pull image-name:1.0
sudo docker images
sudo docker ps -a

sudo docker build -t image-name:1.0 .
sudo docker run -it image-name:1.0 /bin/bash
sudo docker logs -f container_id

sudo docker rm -f container_id
sudo docker rmi -f image-name:1.0
sudo docker system prune

sudo docker-compose build
sudo docker-compose up
```
