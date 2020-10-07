#!/bin/bash

docker-compose -f caddy/docker-compose.yml -f pihole/docker-compose.yml up -d