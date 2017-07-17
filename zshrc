HISTFILE=~/.histfile
HISTSIZE=10000000000000000
SAVEHIST=10000000000000000
set -o INC_APPEND_HISTORY
set -o EXTENDED_HISTORY
set -o HIST_IGNORE_DUPS
set -o HIST_ALLOW_CLOBBER

function newpaper {
    newpaper_tmpnm=$(mktemp)
    newpaper-base "$newpaper_tmpnm" "$@"
    newpaper_name=$(cat $newpaper_tmpnm)
    rm -f $newpaper_tmpnm
    if test -n "$newpaper_name"; then
        cd $newpaper_name
        vim $newpaper_name.tex
    fi
}

function newarduino {
    newarduino_tmpnm=$(mktemp)
    newarduino-base "$newarduino_tmpnm" "$@"
    newarduino_name=$(cat $newarduino_tmpnm)
    rm -f $newarduino_tmpnm
    if test -n "$newarduino_name"; then
        cd $newarduino_name
        vim $newarduino_name.ino
    fi
}

function newclass {
    newclass_tmpnm=$(mktemp)
    newclass-base "$newclass_tmpnm" "$@"
    newclass_name=$(cat $newclass_tmpnm)
    rm -f $newclass_tmpnm
    if test -n "$newclass_name"; then
        vim $newclass_name
    fi
}

alias ros='. /opt/ros/jade/setup.zsh'
