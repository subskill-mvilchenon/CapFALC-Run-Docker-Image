#!/bin/bash
if ! command -v container-structure-test &> /dev/null
then
    curl -LO https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 && chmod +x container-structure-test-linux-amd64 && mkdir -p $HOME/bin && export PATH=$PATH:$HOME/bin && mv container-structure-test-linux-amd64 $HOME/bin/container-structure-test
fi
container-structure-test test \
    --driver docker \
    --image cleyrop/capfalc:latest \
    --config ../docker/misc/test_image.yaml 
