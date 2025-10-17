#!/bin/bash
# system-health.sh - System resource monitoring

# Get system metrics
get_cpu_usage() {
    top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1
}

get_memory_usage() {
    free | grep Mem | awk '{printf("%.2f"), $3/$2 * 100.0}'
}

get_disk_usage() {
    df / | awk 'NR==2 {print $5}' | sed 's/%//'
}

get_uptime() {
    uptime -p
}

# Show system health
show_health() {
    cpu=$(get_cpu_usage)
    memory=$(get_memory_usage)
    disk=$(get_disk_usage)
    uptime=$(get_uptime)
    
    whiptail --title "System Health" --msgbox "\
📊 SYSTEM RESOURCES

CPU Usage: $cpu%
Memory Usage: $memory%
Disk Usage: $disk%
Uptime: $uptime

Generated: $(date +"%Y-%m-%d %H:%M:%S")" 15 50
}

# Run the health check
show_health
