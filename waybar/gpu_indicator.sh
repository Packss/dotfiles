#! /bin/bash
while :
do
    state=$(cat /sys/bus/pci/devices/0000\:01\:00.0/power/runtime_status)

    if [ $state == "active" ]; then
        export $(udevadm info --query=property /sys/bus/pci/devices/0000:01:00.0/ | grep DRIVER=)
        # if the proprietary NVIDIA driver is loaded, we can query the GPU status
        if [ $DRIVER == "nvidia" ]; then
            clients=$(nvidia-smi --query-compute-apps=name --format=csv,noheader)
            sleep 15
        elif [ $DRIVER == "nouveau" ]; then
            clients="Nouveau driver active"
            sleep 5
        else
            clients="No GPU driver loaded"
        fi
        echo "{\"text\": \"GPU: Active\", \"alt\": \"active\", \"tooltip\" : \"Clients:\n$clients\", \"class\": \"active\", \"percentage\": 100}" | jq --unbuffered --compact-output
    else
        echo "{\"text\": \"GPU: Suspend\", \"alt\": \"suspend\", \"tooltip\" : \"GPU is suspended\", \"class\": \"inactive\", \"percentage\": 0}" | jq --unbuffered --compact-output
    sleep 5
    fi
done
