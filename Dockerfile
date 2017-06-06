FROM ruby:2.4

ENV RAILS_ROOT /var/www/monocle
ENV GEM_PATH $RAILS_ROOT/.localgems

RUN apt-get update -qq && apt-get install -y build-essential wget zlib1g-dev liblzma-dev libgmp3-dev software-properties-common vim

# RUN mkdir -p $RAILS_ROOT
# Create application home. App server will need the pids dir so just create everything in one shot
RUN mkdir -p $RAILS_ROOT/tmp/pids

WORKDIR $RAILS_ROOT
RUN gem install bundler
COPY . .
RUN bundle install --path .localgems
RUN gem update && gem update --system

ENTRYPOINT [ "bash","config/containers/start_server.sh" ]
