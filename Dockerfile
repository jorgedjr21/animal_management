FROM ruby:2.6-alpine
RUN apk add --no-cache --update \
  build-base \
  linux-headers \
  nodejs \
  yarn \
  postgresql-dev \
  tzdata \
  graphviz \
  gmp-dev

RUN mkdir /animal_management  
WORKDIR /animal_management
COPY Gemfile /animal_management/Gemfile
COPY Gemfile.lock /animal_management/Gemfile.lock
RUN bundle install
COPY . /animal_management

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["sh", "entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]