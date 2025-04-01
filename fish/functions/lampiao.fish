function lampiao --wraps='ssh -p 2222 enzo@lampiao.ic.unicamp.br' --description 'alias lampiao=ssh -p 2222 enzo@lampiao.ic.unicamp.br'
    ssh -p 2222 enzo@lampiao.ic.unicamp.br $argv
end
