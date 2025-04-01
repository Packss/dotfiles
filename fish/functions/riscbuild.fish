function riscbuild --wraps='clang --target=riscv32 -marchrv32g -mabi=ilp32d -mno-relax' --wraps='clang --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax' --description 'alias riscbuild=clang --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax'
	set name (basename $argv .c)
	clang --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax $argv -S -o $name.s
	clang --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax $name.s -c -o $name.o
    ld.lld $name.o -o $name.x
end
