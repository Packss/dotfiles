function attach-nvidia --wraps='sudo virsh nodedev-reattach pci_0000_01_00_1' --description 'attaches the nvidia gpu'
  sudo virsh nodedev-reattach pci_0000_01_00_1
  sudo virsh nodedev-reattach pci_0000_01_00_0       
  sudo modprobe -r --remove-holders vfio_pci
  sudo modprobe nvidia
  sudo systemctl start nvidia-powerd
  sudo systemctl start nvidia-persistenced
end
