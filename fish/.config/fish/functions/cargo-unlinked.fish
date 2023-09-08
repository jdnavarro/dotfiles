function cargo-unlinked --description "Lists all *.rs files not linked"
	rg --no-filename '^[^/].*\.rs:$' target/debug/deps/*.d \
	| sd ':$' '' \
	| sort -u \
	| comm -13 - (fd '\.rs$' | sort -u | psub)
end