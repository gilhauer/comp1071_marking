#!/bin/bash

# Bootstrap the marking repository by installing tools and cloning the Github repository
REPO=https://github.com/gilhauer/comp1071_marking.git

# [ required packages]
for pkg in git ruby; do
    sudo apt-get -y install ${pkg}
done

# [ clone the repository as root ]
(
    cd /var; \
    sudo rm -rf comp1071_marking; \
    sudo git clone ${REPO}
)