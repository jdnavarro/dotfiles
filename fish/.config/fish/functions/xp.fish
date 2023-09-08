function xp --wraps='kitty +kitten clipboard --get-clipboard' --description 'alias xp=kitty +kitten clipboard --get-clipboard'
  kitty +kitten clipboard --get-clipboard $argv;
end
