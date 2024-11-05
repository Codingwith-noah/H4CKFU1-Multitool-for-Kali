#!/bin/bash

# Colors for decoration
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
BOLD='\033[1m'
RESET='\033[0m'

echo -e " ██░ ██  ▄▄▄       ▄████▄   ██ ▄█▀  █████▒█    ██  ██▓    "
echo -e "▓██░ ██▒▒████▄    ▒██▀ ▀█   ██▄█▒ ▓██   ▒ ██  ▓██▒▓██▒    "
echo -e "▒██▀▀██░▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ ▒████ ░▓██  ▒██░▒██░    "
echo -e "░▓█ ░██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ ░▓█▒  ░▓▓█  ░██░▒██░    "
echo -e "░▓█▒░██▓ ▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄░▒█░   ▒▒█████▓ ░██████▒"
echo -e  "▒ ░░▒░▒ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒ ▒ ░   ░▒▓▒ ▒ ▒ ░ ▒░▓  ░"
echo -e  "▒ ░▒░ ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░ ░     ░░▒░ ░ ░ ░ ░ ▒  ░"
echo -e  "░  ░░ ░  ░   ▒   ░        ░ ░░ ░  ░ ░    ░░░ ░ ░   ░ ░   "
echo -e  "░  ░  ░      ░  ░░ ░      ░  ░             ░         ░  ░"
echo -e  "                  ░                                   "    # ASCII Art for the header
print_header() {
    echo -e "${CYAN}"
    echo "===================================="
    echo -e "       ${BOLD}H4CKFU1${RESET}"
    echo "===================================="
    echo -e "${WHITE}A multi-tool script for penetration testing."
    echo -e "${CYAN}===================================="
    echo
}

# Function to display the main menu
main_menu() {
    echo -e "${YELLOW}${BOLD}Select an option:${RESET}"
    echo -e "${GREEN}1)${RESET} ${WHITE}Nmap - Network Scanning"
    echo -e "${GREEN}2)${RESET} ${WHITE}Netcat - Banner Grabbing"
    echo -e "${GREEN}3)${RESET} ${WHITE}Metasploit - Open Metasploit"
    echo -e "${GREEN}4)${RESET} ${WHITE}Gobuster - Directory Bruteforce"
    echo -e "${GREEN}5)${RESET} ${WHITE}Nikto - Web Vulnerability Scanner"
    echo -e "${GREEN}6)${RESET} ${WHITE}Hydra - Bruteforce SSH"
    echo -e "${GREEN}7)${RESET} ${WHITE}Wireshark - Start Capture"
    echo -e "${RED}8)${RESET} ${WHITE}Exit"
    echo -e "${CYAN}===================================="
    echo -n "Please select an option: "
    read option

    case $option in
        1) network_scan ;;
        2) banner_grab ;;
        3) open_metasploit ;;
        4) gobuster_scan ;;
        5) nikto_scan ;;
        6) hydra_bruteforce ;;
        7) start_wireshark ;;
        8) exit 0 ;;
        *) echo -e "${RED}Invalid selection. Please choose a valid option.${RESET}" && sleep 2 && main_menu ;;
    esac
}

# Network scan function (Nmap)
network_scan() {
    echo -e "${CYAN}Starting Nmap Scan...${RESET}"
    echo -n "Enter target IP or range (e.g., 192.168.1.1/24): "
    read target
    nmap -sS $target
    echo -e "${CYAN}Nmap Scan Completed.${RESET}"
    sleep 2
    main_menu
}

# Banner grabbing with Netcat
banner_grab() {
    echo -e "${CYAN}Starting Netcat Banner Grabbing...${RESET}"
    echo -n "Enter IP address: "
    read ip
    echo -n "Enter port: "
    read port
    nc -v $ip $port
    echo -e "${CYAN}Banner Grabbing Completed.${RESET}"
    sleep 2
    main_menu
}

# Open Metasploit
open_metasploit() {
    echo -e "${CYAN}Opening Metasploit Framework...${RESET}"
    msfconsole
}

# Gobuster directory bruteforce
gobuster_scan() {
    echo -e "${CYAN}Starting Gobuster Scan...${RESET}"
    echo -n "Enter target URL: "
    read url
    echo -n "Enter wordlist path (e.g., /usr/share/wordlists/dirb/common.txt): "
    read wordlist
    gobuster dir -u $url -w $wordlist
    echo -e "${CYAN}Gobuster Scan Completed.${RESET}"
    sleep 2
    main_menu
}

# Nikto web vulnerability scan
nikto_scan() {
    echo -e "${CYAN}Starting Nikto Scan...${RESET}"
    echo -n "Enter target URL: "
    read url
    nikto -h $url
    echo -e "${CYAN}Nikto Scan Completed.${RESET}"
    sleep 2
    main_menu
}

# Hydra SSH Bruteforce
hydra_bruteforce() {
    echo -e "${CYAN}Starting Hydra SSH Bruteforce...${RESET}"
    echo -n "Enter target IP: "
    read target_ip
    echo -n "Enter username list: "
    read userlist
    echo -n "Enter password list: "
    read passlist
    hydra -L $userlist -P $passlist ssh://$target_ip
    echo -e "${CYAN}Hydra Bruteforce Completed.${RESET}"
    sleep 2
    main_menu
}

# Start Wireshark
start_wireshark() {
    echo -e "${CYAN}Starting Wireshark Capture...${RESET}"
    sudo wireshark &
    sleep 2
    main_menu
}

# Call header function
print_header

# Call the main menu function to start the tool
main_menu

