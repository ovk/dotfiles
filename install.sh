#!/bin/bash
set -e

# Directory path with this script
declare -r src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# List with dotfiles to install
declare -ar dotfiles=(
    ".vimrc"
    ".inputrc"
    ".bashrc"
    ".dircolors"
    ".tmux.conf"
    ".gitconfig"
)

# Iterate and link all dotfiles
declare -i num=1
declare -i skipped=0
printf "\n"

# vifmrc needs some special handling to be consistent between Linux and Cygwin
function install_vifmrc()
{
    local src="$src_dir/vifmrc"
    local dst="$HOME/.vifm/vifmrc"
    local old_dir="$HOME/.config/vifm"
    local new_dir="$HOME/.vifm"

    if [ -d $old_dir ]; then
        read -p "    [WARNING] $old_dir directory detected. Delete it first? [Y/n]: " confirmation
        if [[ $confirmation =~ ^(y| ) ]] || [[ -z $confirmation ]]; then
            rm -rf $old_dir
            printf "\n  => $old_dir deleted\n"
        else
            printf "\n    [WARNING] Aborting vifmrc installation as incompatible directory exists\n"
            return
        fi
    fi

    printf "  [$dst] "

    if [ -d $new_dir ]; then
        if [ -f $dst ]; then
            if [ $dst -ef $src ]; then
                printf "(same file) => no action required\n"
            else
                printf "(another file) => skipped\n"
                printf "    [WARNING] vifmrc was skipped\n"
            fi
        else
            ln -s $src $dst
            printf "(doesn't exist) => link created\n"
        fi
    else
        mkdir $new_dir
        ln -s $src $dst
        printf "(no .vifm) => link created\n"
    fi

    printf "\n"
}

# Conky configuration file needs some special treatment
function install_conky_conf()
{
    local src="$src_dir/.config/conky/conky.conf"
    local dst="$HOME/.config/conky/conky.conf"

    printf "  [$dst]: "

    # Install Conky configuration file only if Conky is installed
    if type "conky" 2> /dev/null; then
        # Create config directory for Conky (if does not exists)
        mkdir -p "$HOME/.config/conky"

        if [ -f "$dst" ]; then
            # See if this is already link to our file
            if [ "$dst" -ef "$src" ]; then
                printf "(same file) => no action required\n"
            else
                printf "(another file) => skipped\n"
                printf "    [WARNING] conky.conf was skipped\n"
            fi
        else
            ln -s $src $dst
            printf "(doesn't exist) => link created\n"
        fi
    else
        printf "(conky not installed) => canceled\n"
    fi

    printf "\n"
}

# Install regular dotfiles
for dotfile in "${dotfiles[@]}"
do
    # Make sure file exists in script directory
    if [ ! -f "$src_dir/$dotfile" ]; then
        printf "[ERROR] file $dotfile does not exist in the dotfiles repository\n"
        exit 1
    fi

    printf "  $num/${#dotfiles[@]} [$dotfile]: "

    # Check if the destination file already exists
    if [ -f "$HOME/$dotfile" ]; then
        printf "exists "

        # See if this is already link to our file
        if [ "$HOME/$dotfile" -ef "$src_dir/$dotfile" ]; then
            printf "(same file) => no action required"
        else
            printf "(another file) => skipped"
            ((++skipped))
        fi
    else
        printf "(doesn't exist) "
        ln -s "$src_dir/$dotfile" "$HOME/$dotfile"
        printf "=> link created"
    fi

    printf "\n"
    ((++num))
done

# Print some status
((--num))
printf "\n    $num/${#dotfiles[@]} installed, $skipped skipped\n"

# Extra warning if some files were skipped
if (( $skipped > 0 )); then
    printf "    [WARNING] some files were skipped\n"
fi

printf "\n"

# Install vifmrc
install_vifmrc

# Install Conky config
install_conky_conf
