FROM alpine:3.4
MAINTAINER ashmastaflash

# All the general deps
RUN apk update && \
    apk add \
    ca-certificates \
    g++ \
    gcc \
    git \
    make \
    openssl \
    ruby \
    ruby-dev \
    ruby-io-console \
    ruby-irb \
    ruby-rdoc
RUN gem install --no-rdoc bundler

# Install wlslib
RUN mkdir /source
WORKDIR /source
RUN git clone https://github.com/cloudpassage/wlslib && \
    cd wlslib && \
    gem build ./wlslib.gemspec && \
    gem install wlslib

# Place the app
COPY ./* /app/
WORKDIR /app/

# Install deps for app
RUN bundle install

# Create the dir for report output
RUN mkdir /reports

CMD /app/runner.sh
