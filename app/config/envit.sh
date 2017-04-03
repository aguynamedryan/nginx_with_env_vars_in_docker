#!/bin/sh

# First, let's see what the environment looks like when then container starts up
env

# Dump that into a .env file for Rails to read (if necessary)
env >> /home/app/.env

# Turns out there is a way to have nginx preserve environment variables
# https://github.com/phusion/passenger-docker/tree/rel-0.9.18#nginx_env_vars
#
# So what we do is find all the variable names, then make a file that tells
# nginx to preserve those environment variables.
#
# Now we can pass through any environment variables we want
env_preserver=/etc/nginx/main.d/env_preserver.conf
env | sort | cut -d= -f1 | xargs -I {} echo "env {};" > ${env_preserver}

# Just checking that the file was made
cat ${env_preserver}

