#! /bin/sh

# in docker container

set -xe

. ./.env
. ./db.env

# install rails
bundle init
echo "gem 'rails', '~> ${RAILS_VERSION}'" 1>>Gemfile
bundle install
rails new . --force --database=mysql

# config settings
mkdir -p /${APP_NAME}/tmp/sockets
cat /${APP_NAME}/database.yml | sed -e "s/{{APP_NAME}}/$APP_NAME/g" 1>/${APP_NAME}/config/database.yml
rm /${APP_NAME}/database.yml
cp /${APP_NAME}/puma.rb /${APP_NAME}/config/puma.rb
rm /${APP_NAME}/puma.rb

# set mysql privileges
mysql -h db -u root -p${MYSQL_ROOT_PASSWORD} -e"GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%';FLUSH PRIVILEGES;"
rails db:create