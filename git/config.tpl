[apply]
    # Warn on whitespace errors when applying a patch
    whitespace = warn

[core]
    editor = nvim
    whitespace = trailing-space,-space-before-tab

    # Convert CRLF to LF on commit
    autocrlf = input

[diff]
    algorithm = histogram
    renames = copies

[push]
    default = simple

[pull]
    rebase = true

[log]
    decorate = short
    abbrevCommit = true

[pretty]
    dense = '%C(bold green)%h%Creset: %C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)[%an]%Creset'

[rebase]
	autoStash = true

[commit]
    gpgsign = true

[include]
    path = ~/.config/git/$git_profile

