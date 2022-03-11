#!/bin/bash
read -s -p "Enter dockerhub password for Cleyrop :" PASS 
docker login -u cleyrop -p $PASS
docker push cleyrop/capfalc:latest
