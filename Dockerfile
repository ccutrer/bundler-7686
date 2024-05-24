FROM ruby:3.3.1

RUN gem update --system

WORKDIR "/app"
COPY ["Gemfile",  "test.rb", "."]

RUN unset BUNDLE_APP_CONFIG && \
      bundle cache && \
      gem install faraday -v 2.9.0 && \
      gem install diplomat && \
      gem install faraday -v 2.7.4 && \
      gem uninstall faraday -v 2.9.0 
