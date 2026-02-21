#!/bin/bash
echo "Run the docker environment"
export FLEX_IMAGE=myominnoo/cv:dev.0.0.0.9000
export TUTORIAL_WORKING_DIR=/Users/myominnoo/Documents/GitHub/cv
export RSTUDIO_CONFIG_PATH=~/.config/rstudio
docker-compose up -d