function global_alias
  switch (commandline -t)
  case "l"
    commandline -rt '| less'
  case "h"
    commandline -rt '| head'
  case "t"
    commandline -rt '| tail'
  case "g"
    commandline -rt '| grep'
  case "w"
    commandline -rt '| wc'
  case "cc"
    commandline -rt '| ccze -A'
  case "cl"
    commandline -rt '| ccze -A | less'
  case "v"
    commandline -rt '| vimpager'
  case "e"
    commandline -rt '; and exit'
  end
end

function fish_user_key_bindings
  bind \cx global_alias
end
