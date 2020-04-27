# Defined in - @ line 1
function ls --wraps lsd --description 'alias ls=lsd'
	lsd  $argv;
end
