#!/bin/bash
# network-test.sh - Network connectivity tests

test_internet() {
    if ping -c 2 -W 2 8.8.8.8 &>/dev/null; then
        echo "✅ Internet: CONNECTED"
    else
        echo "❌ Internet: NO CONNECTION"
    fi
}

test_dns() {
    if ping -c 2 -W 2 google.com &>/dev/null; then
        echo "✅ DNS: WORKING"
    else
        echo "❌ DNS: FAILING"
    fi
}

test_ports() {
    echo "Scanning common ports ......"
    for port in 21 22 23 25 80 443 ; do
        if nc -z -w 2 localhost $port &>/dev/null; then
            echo "  ✅ Port $port: OPEN"
        else
            echo "  ❌ Port $port: CLOSED"
        fi
    done
}

show_network_test() {
    whiptail --title "Testing Network..." --msgbox "Running network tests..." 8 40
    
    internet_result=$(test_internet)
    dns_result=$(test_dns)
    port_result=$(test_ports)
    
    whiptail --title "Network Test Results" --msgbox "\
🌐 NETWORK STATUS

$internet_result
$dns_result

$port_result" 15 50
}

# Run network test
show_network_test
