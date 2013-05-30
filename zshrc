. /etc/os-release
test -z ANSI_COLOR && ANSI_COLOR='0;36'
echo -en "\033[$ANSI_COLOR""m"
echo "       /\                     _     _ _                   "
echo "      /  \      __ _ _ __ ___| |__ | (_)_ __  _   ___  __ "
echo "     /'   \    / _\` | '__/ __| '_ \| | | '_ \| | | \ \/ / "
echo "    /_- ~ -\  | (_| | | | (__| | | | | | | | | |_| |>  <  "
echo "   /        \  \__,_|_|  \___|_| |_|_|_|_| |_|\__,_/_/\_\ "
echo "  /  _- - _ '\                                            "
echo " /_-'      '-_\                                           "
echo -en "\033[0m\n"

ls --color=auto

HISTFILE=~/.histfile
HISTSIZE=10000000000000000
SAVEHIST=10000000000000000
set -o INC_APPEND_HISTORY
set -o EXTENDED_HISTORY
set -o HIST_IGNORE_DUPS
set -o HIST_ALLOW_CLOBBER
# Don't complete any of these unless it's unambiguous
fignore=(.log .aux .make .d .fls .pdf .temp .bbl .blg)

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

alias sctl='sudo systemctl'
alias netcfg='sudo netcfg'
alias S='yaourt -S'
alias Syu='yaourt -Syu'
alias Syua='yaourt -Syua'

alias -g servip='192.168.1.183'
alias -g localip='192.168.1'

[ "$1" = wifi-menu ] && sudo wifi-menu
[ "$1" = netcfg-menu ] && sudo netcfg-menu


## http://blog.patshead.com/2011/07/automatically-expanding-zsh-global-aliases-as-you-type.html

typeset -A abbrevs

# Begin Ugly Hack

alias -g | perl -e "print 'abbrevs=('; while (<>) { s/^(.+?)='(.+)'/'\$1' '\$2' /g; s/'\\$/\\$'/g; print; } print ')';" >| /tmp/cheater.zsh
source /tmp/cheater.zsh

# End Ugly Hack

globalias() {
   local MATCH
   LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9\-]#}
   LBUFFER+=${abbrevs[$MATCH]:-$MATCH}
   zle self-insert
}

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches
