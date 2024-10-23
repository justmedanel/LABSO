#!/bin/bash

# Function to display menu options
show_menu() {
    echo "1. Ieșire"
    echo "2. Afișare informații de bază"
    echo "3. Data săptămânii"
    echo "4. Shell instalat"
    echo "5. Afișare informații despre rețea"
    echo "6. Afișare memorie"
    echo "7. Căutare comandă"
    read -p "Alegeți o opțiune: " option
}

# Option 1: Exit the script
iesire_meniu() {
    echo "Ieșire..."
    exit 0
}

# Option 2: Display basic system info (Process ID and current directory)
info_de_baza() {
    echo "ID-ul procesului: $$"
    echo "Directorul curent: $PWD"
}

# Option 3: Display current week number and days until Christmas
data_saptamanala() {
    nr_saptamana=$(date +%V)
    echo "Numărul săptămânii curente: $nr_saptamana"
    
    an_curent=$(date +%Y)
    data_craciun=$(date -d "$an_curent-12-25" +%j)
    ziua_de_azi=$(date +%j)
    zile_craciun=$((data_craciun - ziua_de_azi))
    
    echo "Zile rămase până la Crăciun: $zile_craciun"
}

# Option 4: Display the default shell
shell_instalat() {
    shell=$(grep $USER /etc/passwd | cut -d: -f7)
    echo "Shell-ul instalat: $shell"
}

# Option 5: Display network info (IP and Gateway)
informatii_retea() {
    ip_address=$(hostname -I | awk '{print $1}')
    gateway=$(ip route | grep default | awk '{print $3}')
    echo "Adresa IP: $ip_address"
    echo "Gateway: $gateway"
}

# Option 6: Display memory info (total and available)
afis_memorie() {
    free -h | grep -E 'Mem|total|available'
}

# Option 7: Search for a command in history
cautare() {
    read -p "Introduceți un cuvânt cheie pentru căutare: " keyword
    history | grep "$keyword"
}

# Main script loop
while true; do
    show_menu
    case $option in
        1) iesire_meniu ;;
        2) info_de_baza ;;
        3) data_saptamanala ;;
        4) shell_instalat ;;
        5) informatii_retea ;;
        6) afis_memorie ;;
        7) cautare ;;
        *) echo "Opțiune invalidă! Vă rugăm să încercați din nou." ;;
    esac
done
