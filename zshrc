#. /etc/os-release
#test -z ANSI_COLOR && ANSI_COLOR='0;36'
#echo -en "\033[$ANSI_COLOR""m"
#echo "       /\                     _     _ _                   "
#echo "      /  \      __ _ _ __ ___| |__ | (_)_ __  _   ___  __ "
#echo "     /'   \    / _\` | '__/ __| '_ \| | | '_ \| | | \ \/ / "
#echo "    /_- ~ -\  | (_| | | | (__| | | | | | | | | |_| |>  <  "
#echo "   /        \  \__,_|_|  \___|_| |_|_|_|_| |_|\__,_/_/\_\ "
#echo "  /  _- - _ '\                                            "
#echo " /_-'      '-_\                                           "
#echo -en "\033[0m\n"

#ls --color=auto

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

alias sctl='sudo systemctl'
alias uctl='systemctl --user'
alias netcfg='sudo netcfg'
alias S='yaourt -S'
alias Syu='yaourt -Syu'
alias Syua='yaourt -Syua'

pacman() {
    /usr/bin/pacman "$@"
    rehash
}
yaourt() {
    /usr/bin/yaourt "$@"
    rehash
}

indigo() {
  setopt clobber
  source /opt/ros/indigo/setup.zsh
  export PYTHONPATH=/opt/ros/indigo/lib/python2.7/site-packages:$PYTHONPATH
  export PKG_CONFIG_PATH="/opt/ros/indigo/lib/pkgconfig:$PKG_CONFIG_PATH"
  # Optionally, you can set:
  #export ROS_PACKAGE_PATH=/path/to/your/package/path:$ROS_PACKAGE_PATH

  # Useful aliases
  alias catkin_make="catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so"
  export ROS_PACKAGE_PATH=~/docs/ros/catkin_ws:"$ROS_PACKAGE_PATH"
  #export ROS_PACKAGE_PATH=~/docs/ros/hmc-robot-drivers:~/docs/ros/sphero_ros:"$ROS_PACKAGE_PATH"
  source ~/docs/ros/catkin_ws/devel/setup.zsh

  # If you use Gazebo:
  #source /usr/share/gazebo/setup.sh
  setopt noclobber
}
