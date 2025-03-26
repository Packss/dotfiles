#! /bin/bash
while :
do
    state=$(cat /sys/bus/pci/devices/0000\:01\:00.0/power/runtime_status)

    if [ $state == "active" ]; then
        clients=$(nvidia-smi --query-compute-apps=name --format=csv,noheader)
        echo "{\"text\": \"GPU: Active\", \"alt\": \"active\", \"tooltip\" : \"Clients:\n$clients\", \"class\": \"active\", \"percentage\": 100}" | jq --unbuffered --compact-output
        sleep 15
    else
        echo "{\"text\": \"GPU: Suspend\", \"alt\": \"suspend\", \"tooltip\" : \"GPU is suspended\", \"class\": \"inactive\", \"percentage\": 0}" | jq --unbuffered --compact-output
    sleep 5
    fi
done
