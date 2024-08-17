#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}MariaDB Installation Script${NC}"
echo -e "${YELLOW}Let's get MariaDB up and running on your system! 🚀${NC}"

echo -e "${GREEN}Step 1: Updating package list...${NC}"
sudo apt-get update -y

echo -e "${GREEN}Step 2: Installing necessary packages...${NC}"
sudo apt-get install -y software-properties-common dirmngr ca-certificates apt-transport-https

echo -e "${GREEN}Step 3: Adding MariaDB GPG key...${NC}"
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'

echo -e "${GREEN}Step 4: Setting up MariaDB repository...${NC}"
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mariadb.mirror.triple-it.nl/repo/10.11/ubuntu focal main'

echo -e "${GREEN}Step 5: Updating package list again...${NC}"
sudo apt-get update -y

echo -e "${GREEN}Step 6: Installing MariaDB server...${NC}"
sudo apt-get install -y mariadb-server

echo -e "${GREEN}Step 7: Running MariaDB secure installation...${NC}"
sudo mysql_secure_installation

echo -e "${GREEN}Step 8: Starting and enabling MariaDB service...${NC}"
sudo systemctl start mariadb
sudo systemctl enable mariadb

echo -e "${CYAN}Installation complete!${NC}"
mariadb --version && echo -e "${GREEN}MariaDB is now installed successfully! 🎉${NC}" || echo -e "${RED}Something went wrong! Please check the installation steps. ❌${NC}"
