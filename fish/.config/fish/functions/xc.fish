# Defined in - @ line 1
function xc --description 'alias xc=xsel --clipboard --input'
	xsel --clipboard --input $argv;
end
