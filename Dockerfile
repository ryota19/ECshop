FROM ruby:2.5
RUN apt-get update && apt-get install -y \
        build-essential \ 
        libpq-dev \
        node.js \
        postgresql-client \
        yarn \
        vim

WORKDIR /shop
COPY Gemfile Gemfile.lock /shop/
RUN bundle install 