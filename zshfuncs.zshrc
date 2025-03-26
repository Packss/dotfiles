nmm() {
  nitromode.py -m $1
}

nmf() {
  nitromode.py -c $1 -g $1
}

tdp() {
  sudo ryzenadj -a $1"000" -b $1"000" -c $1"000" $2
}

riscv32gcc() {
  riscv32-unknown-linux-gnu-gcc $@
}
