#!/bin/bash
# service-check.sh - Service status and management for Rocky Linux

check_services() {
    services=("sshd" "nginx" "httpd" "mariadb" "docker")
    status_report=""
    
    for service in "${services[@]}"; do
        if systemctl is-active --quiet "$service" 2>/dev/null; then
            status_report+="✅ $service: RUNNING\n"
        else
            status_report+="❌ $service: STOPPED\n"
        fi
    done
    
    echo -e "$status_report"
}

# Use whiptail to display the service status
status=$(check_services)
whiptail --title "Service Status" --msgbox "🔧 SERVICE STATUS\n\n$status" 15 50

# The rest of the code remains but won't execute automatically
manage_services() {
    services=("sshd" "nginx" "httpd" "mariadb" "docker")
    
    # Build service list for whiptail
    service_list=""
    for service in "${services[@]}"; do
        service_list+="$service $service off "
    done
    
    selected=$(whiptail --title "Service Manager" --radiolist \
        "Select service to manage:" 15 50 5 $service_list 3>&1 1>&2 2>&3)
    
    if [ -n "$selected" ]; then
        action=$(whiptail --title "Action" --menu "Choose action for $selected:" 12 40 3 \
            "restart" "Restart Service" \
            "start" "Start Service" \
            "stop" "Stop Service" 3>&1 1>&2 2>&3)
        
        if [ -n "$action" ]; then
            if sudo systemctl $action "$selected" 2>/dev/null; then
                whiptail --msgbox "✅ $selected $action successful!" 10 40
            else
                whiptail --msgbox "❌ Failed to $action $selected" 10 40
            fi
        fi
    fi
}

show_service_menu() {
    while true; do
        choice=$(whiptail --title "Service Manager" --menu "Choose option:" 12 45 3 \
            "1" "Check Service Status" \
            "2" "Manage Services" \
            "3" "Exit" 3>&1 1>&2 2>&3)
        
        case $choice in
            1)
                status=$(check_services)
                whiptail --title "Service Status" --msgbox "🔧 SERVICE STATUS\n\n$status" 15 50
                ;;
            2)
                manage_services
                ;;
            3|*)
                break
                ;;
        esac
    done
}

# Comment out the menu call since we only want to show service status
# show_service_menu
