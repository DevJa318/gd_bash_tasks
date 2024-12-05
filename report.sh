#!/bin/bash
# - Create script, that generates report file with following information:
#  - current date and time;
# name of current user;
# internal IP address and hostname;
# external IP address;
# name and version of Linux distribution;
# system uptime;
# information about used and free space in / in GB;
# information about total and free RAM;
# number and frequency of CPU cores



echo "$(date)"
echo "$(whoami)"
echo "$(hostname -I)"
echo "$(hostname)"
echo "$(curl -s ifconfig.me)"
echo "$(grep -E '^(VERSION|NAME)=' /etc/os-release)"
echo "$(uptime)"
echo "$(df -h /)"
echo "$(free)"
echo "$(lscpu | grep  ^CPU\( "
#nie wiem jak sprawdzić CPU cores at all
echo "$(cat /proc/cpuinfo | grep MHz)"