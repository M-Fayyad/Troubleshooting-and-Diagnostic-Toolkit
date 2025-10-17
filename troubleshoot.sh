#!/bin/bash
# troubleshoot.sh - Main troubleshooting menu

show_menu() {
    whiptail --title "Troubleshooting Toolkit" --menu "Choose diagnostic tool:" 15 50 5 \
        "1" "System Health Check" \
        "2" "Network Connectivity Test" \
        "3" "Service Status Manager" \
        "4" "Quick Full Diagnostic" \
        "5" "Exit" 3>&1 1>&2 2>&3
}

while true; do
    choice=$(show_menu)
    
    case $choice in
        1)
            bash system-health.sh
            ;;
        2)
            bash network-test.sh
            ;;
        3)
            bash service-check.sh
            ;;
        4)
            # Quick full check - runs all diagnostics
            bash system-health.sh
            bash network-test.sh  
            bash service-check.sh
            ;;
        5)
            whiptail --msgbox "Goodbye! 👋" 8 30
            exit 0
            ;;
        *)
            exit 0
            ;;
    esac
done
