#!/bin/bash
sed "s/tagVersion/$1/g" Deployment.yaml > Chat-app-Deployment.yml
