function og404
    outguess -k $argv[1] -r 404.jpg output && xed output
end
