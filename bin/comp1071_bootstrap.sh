#!/bin/bash

# Bootstrap the marking repository by installing tools and cloning the Github repository
REPO=https://github.com/gilhauer/comp1071_marking.git

# [ required packages]
for pkg in git ruby; do
    sudo apt-get -y install ${pkg}
done

# [ required gems -- needs some tools temporarily installed ]
TMP_PKGS="gcc g++ ruby-dev"
TMP_GEMS="rake"

sudo apt-get -y install ${TMP_PKGS}
sudo gem install ${TMP_GEMS} --http-proxy=http://172.26.6.91:8080

for gem in inspec; do
    sudo gem install ${gem}  --http-proxy=http://172.26.6.91:8080
done

sudo gem remove ${TMP_GEMS} --http-proxy=http://172.26.6.91:8080
sudo apt-get -y remove ${TMP_PKGS}

# [ clone the repository as root ]
(
    cd /var; \
    sudo rm -rf comp1071_marking; \
    sudo git clone ${REPO}
)