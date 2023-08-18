FROM ruby:3.0.0


RUN gem install bundler -v 2.4.8

ADD . /part-box
WORKDIR /part-box


COPY Gemfile* Gemfile.lock ./

RUN bundle install
RUN bundle exec rake assets:precompile
RUN mv -f config/partbox-config.yml.docker config/partbox-config.yml
RUN mv -f config/database.yml.docker config/database.yml
RUN mv -f config/initializers/elasticsearch.rb.docker config/initializers/elasticsearch.rb
RUN mv -f config/initializers/sidekiq.rb.docker config/initializers/sidekiq.rb
RUN mv -f config/environments/production.rb.docker config/environments/production.rb

EXPOSE 80
#CMD ["bundle", "exec", "sidekiq", "-e", "production"]