function riscemu --wraps=echo\ -e\ \'Sair\ com:\ ctrl+a\ x\\nMontar\ com:\ mount\ -t\ 9p\ /dev/root\ /mnt\'\ \&\&\ temu\ \~/.local/lib/risc-emu/root-riscv32.cfg --description alias\ riscemu=echo\ -e\ \'Sair\ com:\ ctrl+a\ x\\nMontar\ com:\ mount\ -t\ 9p\ /dev/root\ /mnt\'\ \&\&\ temu\ \~/.local/lib/risc-emu/root-riscv32.cfg
  echo -e 'Sair com: ctrl+a x\nMontar com: mount -t 9p /dev/root /mnt' && temu ~/.local/lib/risc-emu/root-riscv32.cfg $argv
        
end
