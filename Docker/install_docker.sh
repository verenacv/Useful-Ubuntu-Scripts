#!/bin/bash

# Farben definieren
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # Keine Farbe

# Begrüßung
echo -e "${CYAN}Docker Installation Script${NC}"
echo -e "${YELLOW}Let's get Docker up and running on your system! 🚀${NC}"

# Update package list and install necessary packages
echo -e "${GREEN}Step 1: Updating package list...${NC}"
sudo apt-get update

echo -e "${GREEN}Step 2: Installing necessary packages...${NC}"
sudo apt-get install -y curl gnupg ca-certificates lsb-release

# Create the keyrings directory if it doesn't exist
echo -e "${GREEN}Step 3: Creating keyrings directory...${NC}"
sudo mkdir -p /etc/apt/keyrings 

# Add Docker’s official GPG key
echo -e "${GREEN}Step 4: Adding Docker’s official GPG key...${NC}"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the Docker stable repository
echo -e "${GREEN}Step 5: Setting up Docker stable repository...${NC}"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list again and install Docker Engine and Docker Compose
echo -e "${GREEN}Step 6: Updating package list again...${NC}"
sudo apt-get update

echo -e "${GREEN}Step 7: Installing Docker Engine and Docker Compose...${NC}"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Print Docker version to verify installation
echo -e "${CYAN}Installation complete!${NC}"
docker --version && echo -e "${GREEN}Docker is now installed successfully! 🎉${NC}" || echo -e "${RED}Something went wrong! Please check the installation steps. ❌${NC}"
