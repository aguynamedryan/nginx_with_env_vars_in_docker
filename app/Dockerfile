FROM phusion/passenger-customizable:0.9.18

MAINTAINER Ryan Duryea <aguynamedryan@gmail.com>

RUN rm /etc/apt/sources.list.d/redis*
CMD ["/sbin/my_init"]
RUN /pd_build/utilities.sh
RUN /pd_build/ruby2.2.sh
RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
ADD config/nginx.conf /etc/nginx/sites-enabled/app.conf

# Warm bundle cache trick
ADD Gemfile /tmp/
WORKDIR /tmp/
RUN bundle

# Copy our simple Sinatra app
ADD . /home/app
WORKDIR /home/app
RUN bundle

RUN mkdir -p /etc/my_init.d
ADD config/envit.sh /etc/my_init.d/01_envit.sh
