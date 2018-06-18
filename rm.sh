#! /bin/sh

IMAGE_PREFIX_FLAT=`basename $(pwd) | sed -e "s/_//g"`
IMAGE_PREFIX=`basename $(pwd)`
echo $IMAGE_PREFIX

docker-compose down
docker images | awk '/'"${IMAGE_PREFIX}"'/{print $3}' | tr "\n" " " | xargs docker rmi
docker volume list | awk '/'"${IMAGE_PREFIX}"'/{print $2}' | tr "\n" " " | xargs docker volume rm
docker container | awk '$IMAGE_PREFIX/{print $3}' | tr "\n" " "
