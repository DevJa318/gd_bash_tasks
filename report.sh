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


echo "# CURRENT DATE AND TIME"
echo "$(date)"
echo "# CURRENT USER"
echo "$(whoami)"
echo "# INTERNAL IP ADDRESS"
echo "$(hostname -I)"
echo "# HOSTNAME"
echo "$(hostname)"
echo "# EXTERNAL IP ADDRESS"
echo "$(curl -s ifconfig.me)"
echo "# NAME AND VERSION OF LINUX DISTRIBUTION"
echo "$(grep -E '^(VERSION|NAME)=' /etc/os-release)"
echo "# SYSTEM UPTIME"
echo "$(uptime)"
echo "# USED AND FREE SPACE IN / IN GB"
echo "$(df -h /)"
echo "# TOTAL AND FREE RAM"
echo "$(free)"
echo "# NUMBER AND FREQUENCY OF CPU CORES"
echo "$(lscpu | grep  ^CPU\( )"
echo "$(cat /proc/cpuinfo | grep MHz)"