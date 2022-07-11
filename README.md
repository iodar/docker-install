# Docker Install Scripts

<a href="#Install-Scripts-For-Distros">1. Install Scripts For Distros</a><br>
<a href="#Prerequisites">1.1 Prerequisites</a><br>
<a href="#Install-On-Debian">1.1 Install On Debian</a><br>

This repo contains scripts that simplify the installation of docker on linux operating systems. The scripts
follow the instructions from [docs.docker.com [docs.docker.com]](https://docs.docker.com).

<div id="Install-Scripts-For-Distros" />

## Install Scripts For Distros

Currently only the installation on debian is supported. I will add more scripts for different distros if I need them.

You can download the script via file download or use the commands from the next section.

<div id="Prerequisites" />

## Prerequisites

Run the following command to install curl on your system.

```bash
sudo apt-get install curl
```

<div id="Install-On-Debian" />

## Install On Debian

Download the script from this repo and run the script afterwards.

```bash
curl -L "https://raw.githubusercontent.com/iodar/docker-install/master/install-docker-deb.sh" > install-docker-deb.sh 
chmod 777 install-docker-deb.sh
sudo ./install-docker-deb.sh
```