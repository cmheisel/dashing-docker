FROM 		ruby:2.1.5-slim
MAINTAINER	Chris Heisel "chris@heisel.org"

#Add compiler package and ruby1.9.1
RUN apt-get update && apt-get install -y \
    nodejs \
    build-essential \
    libssl-dev \
    libcurl4-openssl-dev \
    libreadline-dev

# Install dashing and bundle
RUN gem install dashing -v 1.3.4 && \
    gem install bundler -v 1.8.4 && \
    mkdir -p /dashboard

ONBUILD COPY ./dashboard/start.sh /dashboard/
ONBUILD COPY ./dashboard/Gemfile* /dashboard/
ONBUILD RUN cd /dashboard/ && bundle
ONBUILD COPY ./dashboard/* /dashboard/

# Default command that autostarts the dashing project
CMD ["bash", "/dashboard/start.sh"]
