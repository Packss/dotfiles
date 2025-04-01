function detach-nvidia --wraps='sudo virsh nodedev-detach pci_0000_01_00_1' --description 'detaches the nvidia gpu'
  sudo systemctl stop nvidia-powerd
  sudo systemctl stop nvidia-persistenced
  sudo modprobe -r --remove-holders nvidia
  sudo virsh nodedev-detach pci_0000_01_00_1
  sudo virsh nodedev-detach pci_0000_01_00_0       
end
