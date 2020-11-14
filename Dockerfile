FROM ruby:2.5.7-stretch

# update package list
RUN apt-get update -qq
RUN echo "hello"    
RUN apt-get install -y \
    build-essential \
    ca-certificates \
    netcat-traditional \
    emacs \
    vim \
    mysql-client \
    default-libmysqlclient-dev

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y yarn

ENV APP_HOME /workdir
RUN mkdir ${APP_HOME}
WORKDIR ${APP_HOME}

COPY Gemfile ${APP_HOME}/Gemfile
COPY Gemfile.lock ${APP_HOME}/Gemfile.lock

RUN gem install bundler -v 2.1.4
RUN bundle install

COPY . ${APP_HOME}

EXPOSE 8080

ENTRYPOINT ["sh", "./entrypoint.sh"]
