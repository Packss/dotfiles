function cp --wraps=acp --wraps='acp -g' --description 'alias cp=acp -g'
    argparse 'reflink=' -- $argv
    or return
    if set -ql _flag_reflink
        echo "Progress bar not supported for reflink operations"
        /usr/bin/cp --reflink=$_flag_reflink[-1] $argv
    else
        acp -g $argv
    end
end
