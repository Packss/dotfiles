function tdp --wraps='ryzenadj -a  -b  -c ' --description 'alias tdp=ryzenadj -a  -b  -c '
  echo $argv[1]W
  sudo ryzenadj -a $argv[1]000 -b $argv[1]000 -c $argv[1]000 $argv[2]
end
