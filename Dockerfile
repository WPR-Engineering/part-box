FROM ruby:3.0.0


RUN gem install bundler -v 2.4.8

ADD . /part-box
WORKDIR /part-box


COPY Gemfile* Gemfile.lock ./


RUN bundle install
RUN bundle exec rake assets:precompile
RUN mv -f /part-box/config/partbox-config.yml.docker /part-box/config/partbox-config.yml
RUN mv -f /part-box/config/initializers/elasticsearch.rb.docker part-box/config/initializers/elasticsearch.rb
RUN mv -f /part-box/config/initializers/sidekiq.rb.docker part-box/config/initializers/sidekiq.rb
RUN mv -f /part-box/config/environments/production.rb.docker /part-box/config/environments/production.rb

EXPOSE 80
CMD ["rails", "s", "-b", "0.0.0.0", "-e", "production"]