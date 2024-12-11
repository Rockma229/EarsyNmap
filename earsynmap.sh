#!/bin/bash

# Fonction pour afficher le menu principal
afficher_menu() {
    echo "========================="
    echo "     Outil Nmap         "
    echo "========================="
    echo "1. Scan rapide"
    echo "2. Scan complet"
    echo "3. Scan des ports spécifiques"
    echo "4. Détection d'OS et de services"
    echo "5. Scan agressif"
    echo "6. Quitter"
    echo -n "Choisissez une option : "
}

# Fonction pour demander l'adresse IP ou le domaine
demander_cible() {
    read -p "Entrez l'adresse IP ou le domaine cible : " cible
}

# Fonction pour exécuter un scan rapide
scan_rapide() {
    demander_cible
    echo "Exécution d'un scan rapide sur $cible..."
    nmap -T4 -F "$cible"
}

# Fonction pour exécuter un scan complet
scan_complet() {
    demander_cible
    echo "Exécution d'un scan complet sur $cible..."
    nmap -p- "$cible"
}

# Fonction pour exécuter un scan sur des ports spécifiques
scan_ports_specifiques() {
    demander_cible
    read -p "Entrez les ports à scanner (ex : 22,80,443) : " ports
    echo "Exécution d'un scan sur les ports $ports de $cible..."
    nmap -p "$ports" "$cible"
}

# Fonction pour détecter l'OS et les services
detection_os_services() {
    demander_cible
    echo "Détection de l'OS et des services sur $cible..."
    nmap -A "$cible"
}

# Fonction pour exécuter un scan agressif
scan_agressif() {
    demander_cible
    echo "Exécution d'un scan agressif sur $cible..."
    nmap -T4 -A -v "$cible"
}

# Boucle principale
while true; do
    afficher_menu
    read -r choix

    case $choix in
        1)
            scan_rapide
            ;;
        2)
            scan_complet
            ;;
        3)
            scan_ports_specifiques
            ;;
        4)
            detection_os_services
            ;;
        5)
            scan_agressif
            ;;
        6)
            echo "Au revoir !"
            exit 0
            ;;
        *)
            echo "Option invalide, veuillez réessayer."
            ;;
    esac

echo ""
done
