ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION

# for running grant sql, install mysql-client. not needed in rails.
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libmysqlclient-dev \
                       nodejs \
                       mysql-client
RUN gem install bundler

ARG APP_NAME
RUN mkdir -p /${APP_NAME}
WORKDIR /${APP_NAME}