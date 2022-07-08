#!/bin/bash

scriptName="$0"

# this installs docker on a DEBIAN system
function assert-sudo {
    [ $(id -u) -ne 0 ] && echo "Please run as sudo: 'sudo $scriptName'" && exit 1
}

function uninstall-old-docker {
    apt-get remove -y docker docker-engine docker.io containerd runc
}

function install-docker {
    apt-get update -y
    apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update -y
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
}

function print-post-install-notice {
    echo "
NOTE: Docker can only be run as sudo. The current user is
      not part of the docker group. It is recommended to
      run docker in this mode.

NOTE: 'docker-compose' is also installed. It is installed
      as a docker engine plugin.

      Use 'sudo docker compose <args>' to run docker-compose
      commands.

      You can add a custom alias into '~/.profile' or 
      '~/.bashrc' to call 'docker-compose' the old way.
      Simply add 'alias docker-compose='docker compose'
      to your favourite profile-file.

NOTE: To test if the installation was successful run
      'sudo docker run hello world'. If the container
      prints output to the terminal than the
      installation was successful.
"
}

assert-sudo
uninstall-old-docker
install-docker
print-post-install-notice
