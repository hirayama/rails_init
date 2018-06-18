#! /bin/sh

set -x
cd `dirname $0`
shopt -s dotglob
cp -pR ./* ../
cd ../

docker-compose build
docker-compose run --rm --service-ports app ./rails.sh