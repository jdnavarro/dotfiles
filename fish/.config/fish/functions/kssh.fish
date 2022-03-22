function kssh --wraps='kitty +kitten ssh' --description 'alias kssh=kitty +kitten ssh'
  kitty +kitten ssh $argv; 
end
