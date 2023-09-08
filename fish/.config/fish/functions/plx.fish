function plx --wraps "pacman -Ql" -d "List all executables of installed package"
    pacman -Qlq $argv | while read f
        if test -x $f -a ! -d $f
            echo $f
        end
    end
end
