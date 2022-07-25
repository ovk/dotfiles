if status --is-interactive
    source $HOME/.config/fish/aliases.fish

    # Import standard environment variables for POSIX shells
    # if they weren't imported already by login manager
    if test -z "$FISH_PROFILE_READ"
        import_posix_env
    end
end

set -x GPG_TTY (tty)

